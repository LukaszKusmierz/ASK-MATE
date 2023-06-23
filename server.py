import flask
from flask import Flask
import data_manager


app = Flask(__name__)


@app.route('/')
def main_page():
    return flask.render_template("main.html")


@app.route('/list')
def list_questions():
    order_by = flask.request.args.get('order_by')
    order = flask.request.args.get('order_direction')
    if order is not None and order_by is not None:
        questions = data_manager.get_sorted_questions(order_by, order)
        return flask.render_template("list.html", questions=questions)
    else:
        questions = data_manager.get_sorted_questions("submission_time", "DESC")
        return flask.render_template("list.html", questions=questions)


@app.route('/question/<question_id>')
def print_question(question_id):
    data_manager.view_question_dm(question_id)
    question = data_manager.get_question_data_by_id_dm(question_id)
    answers = data_manager.get_answers_by_question_id_dm(question_id)
    return flask.render_template('question.html', question=question, answers=answers)


@app.route('/add_question', methods=['GET', 'POST'])
def add_question():
    if flask.request.method == 'POST':
        title = flask.request.form['title']
        message = flask.request.form['message']
        image_file = flask.request.files['image']
        new_question_id = data_manager.add_question_dm(title, message, image_file)
        return flask.redirect(f'/question/{new_question_id}')
    else:
        return flask.render_template('add_question.html')


@app.route('/question/<question_id>/new_answer', methods=['GET', 'POST'])
def add_answer(question_id):
    if flask.request.method == 'POST':
        message = flask.request.form['message']
        image_file = flask.request.files['image']
        data_manager.add_answer_dm(message, question_id, image_file)
        return flask.redirect(f'/question/{question_id}')
    elif flask.request.method == 'GET':
        return flask.render_template('add_answer.html', question_id=question_id)


@app.route('/question/<question_id>/delete')
def delete_question(question_id):
    data_manager.delete_question_dm(question_id)
    return flask.redirect('/list')


@app.route('/answer/<answer_id>/delete')
def delete_answer(answer_id):
    question_id = data_manager.delete_answer_by_id(answer_id)
    return flask.redirect(f'/question/{question_id}')


@app.route('/question/<question_id>/edit', methods=['GET', 'POST'])
def edit_question(question_id):  # delete file -> util
    delete_image = None
    question = data_manager.get_question_data_by_id_dm(question_id)
    if flask.request.method == 'GET':
        return flask.render_template('edit_question.html', question=question)
    elif flask.request.method == 'POST':
        title = flask.request.form['title']
        message = flask.request.form['message']
        new_image_file = flask.request.files['image']
        old_image_path = question['image']
        remove_image_checkbox = flask.request.form.get('remove_image')
        if 'image' in flask.request.files and new_image_file.filename != '':
            delete_image = True
            data_manager.update_question_dm(title, message, old_image_path, new_image_file, question_id, delete_image)
        elif remove_image_checkbox:
            data_manager.update_question_dm(title, message, old_image_path, new_image_file,
                                            question_id, remove_image_checkbox)
        elif not remove_image_checkbox:
            data_manager.update_question_dm(title, message, old_image_path, new_image_file, question_id, delete_image)
        return flask.redirect(f'/question/{question_id}')


@app.route('/question/<question_id>/vote_up')
def vote_up_questions(question_id):
    if flask.request.args.get("source") == "question":
        data_manager.vote_on_question_dm(question_id, "up")
        return flask.redirect(f'/question/{question_id}')
    else:
        data_manager.vote_on_question_dm(question_id, "up")
        return flask.redirect('/list')


@app.route('/question/<question_id>/vote_down')
def vote_down_questions(question_id):
    if flask.request.args.get("source") == "question":
        data_manager.vote_on_question_dm(question_id, "down")
        return flask.redirect(f'/question/{question_id}')
    else:
        data_manager.vote_on_question_dm(question_id, "down")
        return flask.redirect('/list')


@app.route('/answer/<answer_id>/vote_up')
def vote_up_answers(answer_id):
    question_id = data_manager.vote_on_answer_dm(answer_id, "up")
    return flask.redirect(f'/question/{question_id}')


@app.route('/answer/<answer_id>/vote_down')
def vote_down_answers(answer_id):
    question_id = data_manager.vote_on_answer_dm(answer_id, "down")
    return flask.redirect(f'/question/{question_id}')


@app.route('/search')
def search():
    search_phrase = flask.request.args.get('q')
    if search_phrase:
        questions = data_manager.get_questions_by_search_phrase(search_phrase)
        return flask.render_template('search.html', questions=questions)
    else:
        return flask.redirect('/')


if __name__ == "__main__":
    app.run()
