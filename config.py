LIST_USERS_HEADERS = ['Username', 'Registration date', 'Number of asked questions', 'Number of answers',
                      'Number of comments', 'Reputation']


GAIN_REPUTATION_QUESTION = 5
GAIN_REPUTATION_ANSWER = 10
LOSE_REPUTATION = -2
GAIN_REPUTATION_ACCEPTED = 15
LOSE_REPUTATION_ACCEPTED = -15

PASSWORD_LENGTH_MIN = 3
PASSWORD_LENGTH_MAX = 20
PASSWORD_LENGTH = range(PASSWORD_LENGTH_MIN, PASSWORD_LENGTH_MAX + 1)

USERNAME_LENGTH_MIN = 4
USERNAME_LENGTH_MAX = 50
USERNAME_LENGTH = range(USERNAME_LENGTH_MIN, USERNAME_LENGTH_MAX + 1)

LIST_QUESTIONS_COLUMNS = [
                            {'label': 'Submission Time', 'order_by': 'submission_time'},
                            {'label': 'Number of Views', 'order_by': 'view_number'},
                            {'label': 'Votes', 'order_by': 'vote_number'},
                            {'label': 'Answers', 'order_by': 'number_of_answers'},
                            {'label': 'Title', 'order_by': 'title'},
                            {'label': 'Message', 'order_by': 'message'}
                        ]

SEARCH_COLUMNS = [
                    {'label': 'Submission Time', 'order_by': 'submission_time'},
                    {'label': 'Number of Views', 'order_by': 'view_number'},
                    {'label': 'Votes', 'order_by': 'vote_number'},
                    {'label': 'Title', 'order_by': 'title'},
                    {'label': 'Message', 'order_by': 'message'}
                ]

USER_DETAIL_COLUMNS = ['User ID', 'Username', 'Registration Date', 'Number of asked questions', 'Number of answers',
                       'Number of comments', 'Reputation']

QUESTION_DETAIL_COLUMNS = ['Title', 'Message', 'Image']

ANSWER_DETAIL_COLUMNS = ['Message', 'Image']

COMMENT_DETAIL_COLUMNS = ['Message']

ORDER_COL_GET_SORTED_Q = {
            'submission_time': 'submission_time',
            'view_number': 'view_number',
            'vote_number': 'vote_number',
            'title': 'title',
            'message': 'message'
}
