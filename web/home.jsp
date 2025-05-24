<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextGen Online Courses - Register Now</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: #333;
            overflow-x: hidden;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background-color: rgba(255, 255, 255, 0.9);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo img {
            width: 50px;
            margin-right: 10px;
        }
        .logo a {
            font-size: 1.5rem;
            font-weight: 700;
            color: #333;
            text-decoration: none;
        }
        .navbar a {
            color: #333;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #007bff;
        }
        .bg_image {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5rem 2rem;
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            gap: 2rem;
        }
        .image-container {
            flex: 1;
            max-width: 50%;
        }
        .content-container {
            flex: 1;
            max-width: 50%;
        }
        .container img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #2c3e50;
        }
        p {
            margin-bottom: 2rem;
            color: #34495e;
        }
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                text-align: center;
            }
            .image-container, .content-container {
                max-width: 100%;
            }
            .image-container {
                margin-bottom: 2rem;
            }
            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="pngwing.com.png" alt="NextGen Logo">
            <a href="#">NextGen</a>
        </div>
        <nav class="navbar">
            <a href="login.jsp">Login</a>
        </nav>
    </header>

    <div class="bg_image">
        <div class="container">
            <div class="image-container">
                <img src="23.png" alt="Online Learning">
            </div>
            <div class="content-container">
                <h1>Register for Online Courses</h1>
                <p>Unlock your potential with our flexible online courses. Register today to access quality content, expert instructors, and a supportive learning community, all from the comfort of your home!</p>
                <div class="btn_container">
                    <a href="register.jsp"><button class="btn">New Registration</button></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>