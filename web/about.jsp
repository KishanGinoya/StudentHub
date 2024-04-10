<html>
  <head>
    <meta charset="utf-8" />
    <meta name="author" content="Kodinger" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Student Hub</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="css/feed.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <nav>
      <div class="container">
        <div class="logo">
          <a href="index.html"><img src="img/name.png" alt="logo" /></a>
        </div>
        <div class="search-bar">
          <i class="uil uil-search"></i>
          <input type="text" placeholder="Search" />
        </div>
        <div class="create">
          <label class="btn btn-primary" for="create-post">+ Create</label>
          <div class="profile-pic">
            <img
              src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp"
              alt="pic 1"
            />
          </div>
        </div>
      </div>
    </nav>
    <main class="main">
      <div class="container">
        <div class="left">
          <a class="profile">
            <div class="profile-pic">
              <img
                src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp"
              />
            </div>
            <div class="handle">
              <h4>Student</h4>
              <p class="text-muted">@Student</p>
            </div>
          </a>
          <div class="sidebar">
            <a class="menu-item">
              <span><i class="uil uil-home"></i></span>
              <h3>Home</h3>
            </a>
            <a class="menu-item">
              <span><i class="uil uil-bookmark"></i></span>
              <h3>Profile</h3>
            </a>
            <a class="menu-item active">
              <span><i class="uil uil-analytics"></i></span>
              <h3>About</h3>
            </a>
            <a class="menu-item">
              <span><i class="uil uil-palette"></i></span>
              <h3>Feedback</h3>
            </a>
            <label class="btn btn-primary" for="create-post">Create Post</label>
          </div>
        </div>
        <div class="middle">
          <div class="feeds">
            <div class="feed">
              <div class="user">
                <div class="info">
                  <h1>Feedback</h1>
                </div>
              </div>
            </div>
            <div class="about">
                <h2 class="about__title">Student Hub - TM102</h2>
                <p class="about__details">We are a team driven by the spirit of learning and innovation. 
                    Our journey is centered around the idea that every project is an opportunity to grow, learn, and inspire. 
                    We embrace challenges as learning experiences and draw inspiration from each endeavor.
                    We are passionate about the possibilities that emerge from pushing boundaries and believe that every project contributes to our collective growth. 
                    Join us in this dynamic journey of discovery and inspiration!
                </p>
                <p>Vraj Lathiya, Tushar Jana, Kishan Ginoya, Khushal Ganatra.</p>
            </div>
        </div>
      </div>
    </main>
  </body>
</html>
