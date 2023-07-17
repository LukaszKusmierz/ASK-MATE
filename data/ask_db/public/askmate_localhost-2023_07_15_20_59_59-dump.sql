--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: askmate; Type: DATABASE; Schema: -; Owner: askmate2
--

CREATE DATABASE askmate WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';


ALTER DATABASE askmate OWNER TO askmate2;

\connect askmate

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answer; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.answer (
    id integer NOT NULL,
    submission_time timestamp without time zone,
    vote_number integer,
    question_id integer,
    message text,
    image text,
    user_id integer,
    is_accepted boolean DEFAULT false,
    reputation_status boolean DEFAULT false
);


ALTER TABLE public.answer OWNER TO askmate2;

--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: askmate2
--

CREATE SEQUENCE public.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_id_seq OWNER TO askmate2;

--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: askmate2
--

ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    question_id integer,
    answer_id integer,
    message text,
    submission_time timestamp without time zone,
    edited_count integer,
    user_id integer
);


ALTER TABLE public.comment OWNER TO askmate2;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: askmate2
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO askmate2;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: askmate2
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.question (
    id integer NOT NULL,
    submission_time timestamp without time zone,
    view_number integer,
    vote_number integer,
    title text,
    message text,
    image text,
    user_id integer
);


ALTER TABLE public.question OWNER TO askmate2;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: askmate2
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO askmate2;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: askmate2
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_tag; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.question_tag (
    question_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.question_tag OWNER TO askmate2;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.tag OWNER TO askmate2;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: askmate2
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO askmate2;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: askmate2
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: askmate2
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    email character varying,
    password character varying,
    registration_date timestamp without time zone,
    reputation integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO askmate2;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: askmate2
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO askmate2;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: askmate2
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.id;


--
-- Name: answer id; Type: DEFAULT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: askmate2
--

INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (23, '2023-07-14 22:01:03', 0, 13, 'If you want to loop it indefinitely simply add while True to the program:

while True:
    EnterWord = input ("Please Enter your Word here: ")
    Reverse = EnterWord [::-1]

    if EnterWord.lower() == Reverse.lower():
         print ("Hurrah!!! You have just found a Palindrome")
    else:
         print ("Oh, Come on! you can do this man...")', NULL, 6, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (24, '2023-07-14 22:01:23', 0, 13, 'Try this

while True:
   EnterWord = input ("Please Enter your Word here: ")
   Reverse = EnterWord [::-1]

   if EnterWord.lower() == Reverse.lower():
       print ("Hurrah!!! You have just found a Palindrome")
   else: 
       print ("Oh, Come on! you can do this man...")', 'static/uploads/d52a02f1-5e1d-4e4c-ad54-4b03dcf377b4.jpeg', 6, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (25, '2023-07-14 22:01:50', 0, 13, 'I think this is what you''re looking for:

EnterWord = input ("Please Enter your Word here: ")
Reverse = EnterWord [::-1]

while EnterWord.lower() != Reverse.lower():
    EnterWord = input ("Please Enter your Word here: ")
    Reverse = EnterWord [::-1]
    print ("Oh, Come on! you can do this man...")

print ("Hurrah!!! You have just found a Palindrome")', 'static/uploads/e9319d2b-e885-46e0-a5e2-93c738fd3d56.jpeg', 6, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (26, '2023-07-14 22:02:38', 0, 13, 'Better now! And do like @MorganThrapp has said in future... ', NULL, 6, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (17, '2023-07-14 21:48:45', 0, 10, '*Note: In all of the tests, I replaced range with xrange. Since the latter returns an iterator, it should always be faster than the former.', 'static/uploads/9e686490-9c12-4de7-a58c-6a6962769739.png', 5, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (18, '2023-07-14 21:52:04', 0, 11, 'This can be achieved directly with a dictionary combined with a loop：

store each type of data in the form of "letter_", e.g. {"A_": ["A_1", "A_2"]}
Loop through each data in the list, if the type is not in the dictionary, create a list with the prefix type of this data, otherwise add it directly to the list of this type
Finally, directly convert the values of the dictionary into a list to achieve the requirement', 'static/uploads/c6d9eeec-1563-4949-ad14-f083d567f34b.jpeg', 5, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (19, '2023-07-14 21:52:44', 0, 11, 'I provided a easily understandable way (but requires more lines than other advanced thecniques)

You can use dictionary, in particular, I used defaultdict here to set default value as a list ([]).

I grouped the list by first letter in a for loop, as follows:

from collections import defaultdict

l = [''A_1'', ''A_2'', ''A_3'', ''A_4'', ''B_1'', ''B_2'', ''C_1'', ''C_2'', ''C_3'']

group = defaultdict(list)

for item in l:
    first_letter = item[0] # saving items by first letter
    group[first_letter].append(item)

result = list(group.values())
print(result)
# [[''A_1'', ''A_2'', ''A_3'', ''A_4''], [''B_1'', ''B_2''], [''C_1'', ''C_2'', ''C_3'']]', 'static/uploads/7cdb2fcf-88fc-484c-92dd-c27484127d82.jpeg', 5, false, false);
INSERT INTO public.answer (id, submission_time, vote_number, question_id, message, image, user_id, is_accepted, reputation_status) VALUES (20, '2023-07-14 21:53:03', 0, 11, 'You can use itertools.groupby for that. This assumes that the input is sorted, as in your example.

from itertools import groupby

lst = [''A_1'', ''A_2'', ''A_3'', ''A_4'', ''B_1'', ''B_2'', ''C_1'', ''C_2'', ''C_3'']
output = [list(g) for _, g in groupby(lst, key=lambda x: x[0])]
print(output) # [[''A_1'', ''A_2'', ''A_3'', ''A_4''], [''B_1'', ''B_2''], [''C_1'', ''C_2'', ''C_3'']]
If for some reason you don''t want to use import but only use built-ins,

lst = [''A_1'', ''A_2'', ''A_3'', ''A_4'', ''B_1'', ''B_2'', ''C_1'', ''C_2'', ''C_3'']

output = {}
for x in lst:
    if x[0] in output:
        output[x[0]].append(x)
    else:
        output[x[0]] = [x]
print(list(output.values()))
Note that with an input list of [''A_1'', ''B_1'', ''A_2''] the two approaches will result in different outputs.', NULL, 5, false, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: askmate2
--

INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (23, 10, NULL, '+1 I have deleted my answer, please include the reason why we should use it with only immutable items.', '2023-07-14 21:49:31', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (24, 10, NULL, 'Note that xrange is not available in python 3.x, though I assume that xrange has been replaced with range in python 3.x.', '2023-07-14 21:49:49', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (25, 10, NULL, 'Using range() in 3.3.3 I get the following results (using %timeit magic in IPython) in μs/loop: append - 44.1, loop - 77.1, comprehension - 20.5, multiplication - 2.26', '2023-07-14 21:50:10', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (26, NULL, 20, 'Using in on a dictionnary search in the keys ? Or is it because theres no str value that contains the prefix ?', '2023-07-14 21:53:27', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (27, NULL, 19, '@SharimIqbal you shouldn''t have edited the code like this without confirming from the OP. It could be that they meant variable names. ', '2023-07-14 21:53:43', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (28, 11, NULL, 'What are A_1 etc? Are they strings ''A_1'', for example?', '2023-07-14 21:53:57', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (29, 11, NULL, 'Does it mean that you want to group by the first letter?', '2023-07-14 21:54:10', NULL, 5);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (36, 13, NULL, 'Write while True: at the top', '2023-07-14 22:00:13', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (37, 13, NULL, 'Oh, Come on! you can do better than this. How about showing us what you have tried? Have you read the python docs to learn how loops work? ', '2023-07-14 22:00:28', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (38, 13, NULL, 'I''m voting to close this question as off-topic because this question shows little effort on the OP''s part to resolve the issue they are asking about', '2023-07-14 22:00:49', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (39, NULL, 25, 'Come on, add some code indentation!', '2023-07-14 22:02:07', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (40, NULL, 25, 'It''s very important to actually test and run your code before you post it in an answer', '2023-07-14 22:02:22', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (41, NULL, 26, 'For the first non-palindrome, "Oh, come on..." is not printed, and for a palindrome entered after a non palindrome, "Oh, come on..." is printed. The print call should be just after the while.', '2023-07-14 22:02:57', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (42, NULL, 26, 'Okay, this is good. I added the print call just after the while and it gave me what i wanted. After finding a palindrome, can it loop back to the "please enter your word here" without going into an infinite loop? Thanks for helping out.', '2023-07-14 22:03:14', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (43, NULL, 24, 'Yes, you''d just need to have some way for the user to exit the loop. So, you''d move the "Please Enter your Word here: " to the first line of the while loop and change your looping condition.', '2023-07-14 22:03:32', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (44, NULL, 26, 'I''m voting to close this question as off-topic because this question shows little effort on the OP''s part to resolve the issue they are asking about', '2023-07-14 22:03:53', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (45, 14, NULL, 'Use for loop to count, you can not just count to 9 with og statement ,or make a recurrtion call', '2023-07-14 22:05:28', NULL, 6);
INSERT INTO public.comment (id, question_id, answer_id, message, submission_time, edited_count, user_id) VALUES (46, 14, NULL, 'If you have code and/or a question is about a certain language, tag the language. It not only helps users find the question, but also affects syntax coloring', '2023-07-14 22:05:42', NULL, 6);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: askmate2
--

INSERT INTO public.question (id, submission_time, view_number, vote_number, title, message, image, user_id) VALUES (14, '2023-07-14 22:05:08', 3, 0, 'Simple "if" statements in Python', 'I''m having difficulty making this simple if statement work. I''m trying to get a string to print for a set amount of times using an ''if'' statement

x = 0
if x < 9:
    print "this works"
    x = x + 1
else:
    print "this doesn''t work"
The result of the code above is that it prints "this works" only once. I want 1 to be added to x until x reaches 9 and the statement is not longer true.

Can anyone help me here?', 'static/uploads/dc1be5ac-529e-497e-b6dd-ad3676173681.jpeg', 6);
INSERT INTO public.question (id, submission_time, view_number, vote_number, title, message, image, user_id) VALUES (13, '2023-07-14 21:59:49', 23, 0, 'How do I create a loop in Python? [closed]', 'Closed. This question is not reproducible or was caused by typos. It is not currently accepting answers.
This question was caused by a typo or a problem that can no longer be reproduced. While similar questions may be on-topic here, this one was resolved in a way less likely to help future readers.

Closed 7 years ago.

How do I put this code into a loop?

EnterWord = input ("Please Enter your Word here: ")
Reverse = EnterWord [::-1]

if EnterWord.lower() == Reverse.lower():
    print ("Hurrah!!! You have just found a Palindrome")

else:
    print ("Oh, Come on! you can do this man...")
How can I do that?', 'static/uploads/45eb623b-b7c8-4027-a609-8bd3cd3c1bc1.jpeg', 6);
INSERT INTO public.question (id, submission_time, view_number, vote_number, title, message, image, user_id) VALUES (10, '2023-07-14 21:46:47', 14, 0, 'Best and/or fastest way to create lists in python', 'In python, as far as I know, there are at least 3 to 4 ways to create and initialize lists of a given size:

Simple loop with append:

my_list = []
for i in range(50):
    my_list.append(0)
Simple loop with +=:

my_list = []
for i in range(50):
    my_list += [0]
List comprehension:

my_list = [0 for i in range(50)]
List and integer multiplication:

my_list = [0] * 50
In these examples I don''t think there would be any performance difference given that the lists have only 50 elements, but what if I need a list of a million elements? Would the use of xrange make any improvement? Which is the preferred/fastest way to create and initialize lists in python?', 'static/uploads/a2f5cc08-9064-4de5-bd3b-0fd3cd7a024e.jpeg', 5);
INSERT INTO public.question (id, submission_time, view_number, vote_number, title, message, image, user_id) VALUES (11, '2023-07-14 21:51:33', 8, 0, 'How to create List of List in Python', 'I have a below list.

[''A_1'', ''A_2'', ''A_3'', ''A_4'', ''B_1'',''B_2'', ''C_1'', ''C_2'', ''C_3'']

I need the output in below format.

[[''A_1'', ''A_2'', ''A_3'', ''A_4''], [''B_1'', ''B_2''], [''C_1'', ''C_2'', ''C_3'']]

I am very new to Python, is there any way to achieve the above output that it would be really helpful.', 'static/uploads/f58dcab8-20fb-4f0d-ba9c-9b94a0ff31f1.jpg', 5);


--
-- Data for Name: question_tag; Type: TABLE DATA; Schema: public; Owner: askmate2
--



--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: askmate2
--

INSERT INTO public.tag (id, name) VALUES (1, 'python');
INSERT INTO public.tag (id, name) VALUES (2, 'sql');
INSERT INTO public.tag (id, name) VALUES (3, 'css');
INSERT INTO public.tag (id, name) VALUES (4, 'how');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: askmate2
--

INSERT INTO public.users (id, username, email, password, registration_date, reputation) VALUES (6, 'edek', 'edek@wp.pl', '$2b$12$eNARdF4tJ/M8ili8oaejN.gwHyPlN28UgWhbOAI8tMdOxa6g/IhrG', '2023-07-05 19:21:50', 50);
INSERT INTO public.users (id, username, email, password, registration_date, reputation) VALUES (7, 'luk', 'luk@wp.pl', '$2b$12$bq.sre3inl08V463erSN3OnFuDlvde80CT0RAzj9nwBkJ2oz3Bqzi', '2023-07-05 19:22:07', 35);
INSERT INTO public.users (id, username, email, password, registration_date, reputation) VALUES (5, 'lukas', 'lukasz@lukspeed.eu', '$2b$12$nVb7StUZafSjRatRCJ2Y7.1DHSmvPufTGjlfi.HfCyVmiI.dWbd0.', '2023-07-05 18:00:06', 22);


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: askmate2
--

SELECT pg_catalog.setval('public.answer_id_seq', 26, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: askmate2
--

SELECT pg_catalog.setval('public.comment_id_seq', 46, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: askmate2
--

SELECT pg_catalog.setval('public.question_id_seq', 14, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: askmate2
--

SELECT pg_catalog.setval('public.tag_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: askmate2
--

SELECT pg_catalog.setval('public.users_user_id_seq', 7, true);


--
-- Name: answer pk_answer_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT pk_answer_id PRIMARY KEY (id);


--
-- Name: comment pk_comment_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT pk_comment_id PRIMARY KEY (id);


--
-- Name: question pk_question_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT pk_question_id PRIMARY KEY (id);


--
-- Name: question_tag pk_question_tag_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question_tag
    ADD CONSTRAINT pk_question_tag_id PRIMARY KEY (question_id, tag_id);


--
-- Name: tag pk_tag_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT pk_tag_id PRIMARY KEY (id);


--
-- Name: users pk_user_id; Type: CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_user_id PRIMARY KEY (id);


--
-- Name: comment fk_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_answer_id FOREIGN KEY (answer_id) REFERENCES public.answer(id) ON DELETE CASCADE;


--
-- Name: answer fk_answer_question; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT fk_answer_question FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: comment fk_comment_answer; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_comment_answer FOREIGN KEY (answer_id) REFERENCES public.answer(id) ON DELETE CASCADE;


--
-- Name: comment fk_comment_question; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_comment_question FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: answer fk_question_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: comment fk_question_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: question_tag fk_question_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question_tag
    ADD CONSTRAINT fk_question_id FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: question_tag fk_question_tag_question; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question_tag
    ADD CONSTRAINT fk_question_tag_question FOREIGN KEY (question_id) REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: question fk_question_user; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fk_question_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: question_tag fk_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question_tag
    ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: answer fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comment fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: question fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: askmate2
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

