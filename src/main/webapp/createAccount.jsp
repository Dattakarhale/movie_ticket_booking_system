<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="css/bootstrap.min.css" rel="Stylesheet">
    <link rel="stylesheet" href="stylecss1.css">
    <style type="text/css">
        body {
            background-image: url("sign_up.jpg");
            background-size: cover;
        }

        .create-container {
            display: flex;
            height: 100vh;
            width: 100%;
            flex-wrap: wrap;
            justify-content: center;
            padding: 10px;
        }

        .form-head {
            height: 16vh;
            width: 100%;
            font-size: 4.2rem;
            border-bottom: 2px solid #bb7777;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-head p {
            font-size: 3.3rem;
            color: #9932cc;
        }

        .form-body {
            height: 80vh;
            width: 50%;
            padding: 15px;
            color: #DC143C;
            border: 2px solid #BB7777;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        .custom-input {
            border: 2px solid #007BFF;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
        }

        .custom-btn {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .custom-btn:hover {
            background-color: #F0FFF0;
        }
    </style>
</head>

<body>
    <div class="create-container">
        <div class="form-head">
            <p>Sign up</p>
        </div>
        <div class="form-body">
            <form action="./servlet1" method="get">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input class="form-control custom-input" type="text" name="name" id="name" placeholder="Enter Your Name">
                </div>

                <div class="mb-3">
                    <label for="mob" class="form-label">Mobile Number</label>
                    <input class="form-control custom-input" type="text" name="mob" id="mob" placeholder="Enter 10 digit Number">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input class="form-control custom-input" type="text" name="email" id="email" placeholder="name@example.com">
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control custom-input"
                        aria-describedby="passwordHelpBlock">
                    <div id="passwordHelpBlock" class="form-text">
                        Your password must be 8-20 characters long.
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="submit" class="btn custom-btn" name="submit" value="create">Create Account</button>
                    <a class="btn btn-primary" href="login.jsp" role="button">Back</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
