import datetime
import uuid
import os
from pathlib import Path
from flask import session, redirect
from functools import wraps
import config
import data_manager




def allowed_file(filename):
    return filename.rsplit('.', 1)[1].lower() in config.ALLOWED_EXTENSIONS


def save_image(image_file):
    if image_file and allowed_file(image_file.filename):
        unique_filename = str(uuid.uuid4()) + os.path.splitext(image_file.filename)[1]
        image_path = 'static/uploads/' + unique_filename
        image_file.save(image_path)
        return image_path
    else:
        raise ValueError('Invalid file format. Please upload a JPG or PNG file.')


def get_time():
    return datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def delete_image_files(image_paths):
    [Path(image_path).unlink() for image_path in image_paths if image_path and
     Path(image_path).is_file() and Path(image_path).exists()]


def is_logged_in(function):
    @wraps(function)
    def is_logged_wrapper(*args, **kwargs):
        if "is_logged" in session and session["is_logged"]:
            return function(*args, **kwargs)
        else:
            return redirect("/login")
    return is_logged_wrapper


def user_data(user_id):
    users = data_manager.get_users_list()
    user_dict = next(user for user in users if user['id'] == int(user_id))
    user = {
        'table_name': "User details",
        'headers': config.USER_DETAIL_COLUMNS,
        'user_data': [list(user_dict.values())],
        'skip_id': False
    }
    return user


def user_questions_data(user_id):
    questions_dict_list = data_manager.get_questions_by_user_id(user_id)
    if len(questions_dict_list):
        user_data_q = [
                [f'<a href="/question/{q["id"]}">{q["title"]}</a>'] + list(q.values())[2:3] + [
                    f'<img src="../{q["image"]}"style="max-width: 150px;">'] for q in questions_dict_list
        ]
        questions = {
            'table_name': "Questions",
            'headers': config.QUESTION_DETAIL_COLUMNS,
            'user_data': user_data_q,
            'skip_id': True
        }
        return questions


def user_answers_data(user_id):
    answers_dict_list = data_manager.get_answers_by_user_id(user_id)
    if len(answers_dict_list):
        user_data_a = [
                [f'<a href="/question/{a["question_id"]}">{a["message"]}</a>'] + [
                    f'<img src="../{a["image"]}"style="max-width: 150px;">'] for a in answers_dict_list
        ]
        answers = {
            'table_name': "Answers",
            'headers': config.ANSWER_DETAIL_COLUMNS,
            'user_data': user_data_a,
            'skip_id': True,
        }
        return answers


def user_comments_data(user_id):
    comments_dict_list = data_manager.get_comments_by_user_id(user_id)
    if len(comments_dict_list):
        answers_dict_list = data_manager.get_answers_by_user_id(user_id)
        answer_id_to_question_id = {a['id']: a['question_id'] for a in answers_dict_list}
        user_data_c = [
            [f'<a href="/question/{c["question_id"]}">{c["message"]}</a>']
            if c["question_id"] is not None
            else [f'<a href="/question/{answer_id_to_question_id[c["answer_id"]]}">{c["message"]}</a>']
            if c["answer_id"] in answer_id_to_question_id
            else [f'<a href="/answer/{c["answer_id"]}">{c["message"]}</a>']
            for c in comments_dict_list
        ]
        comments = {
            'table_name': "Comments",
            'headers': config.COMMENT_DETAIL_COLUMNS,
            'user_data': user_data_c,
            'skip_id_c': True
        }
        return comments

