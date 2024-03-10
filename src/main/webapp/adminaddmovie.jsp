<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="adminmainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
    <link rel="stylesheet" href="stylecss2.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-image: url("admin5.jpg");
            background-size: cover;
            background-color: #d0cfe5;
        }

        .book-ticket-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .book-form-container {
            background-color: #AFEEEE;
            width: 50%;
            padding: 50px;
            border: 2px solid #007BFF;
            border-radius: 10px;
            margin-top: 20px;
        }

        .form-members {
            display: flex;
            margin-bottom: 10px;
        }

        .form-label-custom {
            display: flex;
            width: 30%;
            align-items: center;
        }

        .form-data {
            display: flex;
            width: 70%;
            flex-wrap: wrap;
            justify-content: space-evenly;
        }

        .show {
            display: grid;
            grid-template-columns: 1fr 2fr 2fr;
            justify-items: center;
            align-items: center;
            margin: 10px 0px;
        }

        .showtime {
            display: flex;
            width: 100%;
            justify-content: center;
        }

        .showgrid {
            margin: 20px 0px;
        }

        input[type="time"] {
            width: 80%;
            outline: none;
            border: 1px solid #007BFF;
        }

        input[type="text"] {
            border: 2px solid #007BFF;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
            font-size: 17px;
        }

        textarea {
            resize: none;
            width: 100%;
            outline: none;
            border: 2px solid #007BFF;
            border-radius: 8px;
        }

        select {
            border: 2px solid #007BFF;
            border-radius: 5px;
            width: 80%;
            outline: none;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="book-ticket-container">
        <div class="book-form-container">
            <form action="servlet3" method="get">
                <div class="form-members">
                    <div class="form-label-custom">
                        <strong>Movie Title</strong>
                    </div>
                    <div class="form-data">
                        <input type="text" name="movie_name" id="movie_name" placeholder="Enter Movie Name">
                    </div>
                </div>
                <div class="form-members">
                    <div class="form-label-custom">
                        <strong>Movie Description</strong>
                    </div>
                    <div class="form-data">
                        <textarea rows="4" name="movie_description" placeholder="Enter Movie Description"></textarea>
                    </div>
                </div>
                <div class="form-members">
                    <div class="form-label-custom">
                        <strong>Movie Duration</strong>
                    </div>            
                    <div class="form-data">
                        <input type="time" step="2" name="movie_duration">
                    </div>
                </div>
                <div class="form-members">
                    <div class="form-label-custom">
                        <strong>Movie Rating</strong>
                    </div>
                    <!-- Add this code to your form for movie images -->
					<div class="form-members">
					    <div class="form-label-custom">
					        <label for="movie_image"><strong>Movie Image</strong></label>
					    </div>
					    <div class="form-data">
					        <input type="file" name="movie_image" id="movie_image" accept="image/*" required>
					    </div>
					</div>
                    <div class="form-data">
                        <select name="movie_rating">
                            <option disabled selected>Select From 1 - 5 rating</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
                <div class="form-members">
                    <div class="form-label-custom">
                        <strong>Price</strong>
                    </div>
                    <div class="form-data">
                        <input type="text" name="movie_price" placeholder="Enter Price of Single Seat">
                    </div>
                </div>
                <div class="showgrid">
                    <div class="show">
                        <div></div>
                        <div><strong>Show Time</strong></div>
                        <div><strong>Seats</strong></div>
                    </div>
                    <div class="show">
                        <div class="form-label-custom" style="text-align: right; width: 100%">
                            <strong>Show 1</strong>
                        </div>
                        <div class="showtime">
                            <input type="time" name="show1time">
                        </div>
                        <div class="form-data">
                            <input type="text" name="show1seat" placeholder="Show 1 Seat">
                        </div>
                    </div>
                    <div class="show">
                        <div class="form-label-custom" style="text-align: right; width: 100%">
                            <strong>Show 2</strong>
                        </div>
                        <div class="showtime">
                            <input type="time" name="show2time">
                        </div>
                        <div class="form-data">
                            <input type="text" name="show2seat" placeholder="Show 2 Seat">
                        </div>
                    </div>
                    <div class="show">
                        <div class="form-label-custom" style="text-align: right; width: 100%">
                            <strong>Show 3</strong>
                        </div>
                        <div class="showtime">
                            <input type="time" name="show3time">
                        </div>
                        <div class="form-data">
                            <input type="text" name="show3seat" placeholder="Show 3 Seat">
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-success" type="submit" name="submit" value="add">Add Movie</button>
                    <a class="btn btn-danger" href="adminhome.jsp" role="button">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
