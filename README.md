<a name="readme-top"></a>

<div align="center">
 
  <h3><b>Rails Blog: A simple blog application built with Ruby on Rails</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    <!-- - [🚀 Live Demo](#live-demo) -->
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Rails Blog <a name="about-project"></a>

**Rails Blog** is a blog application made with Ruby on Rails.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>RoR</li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Add User**
- **Add Post**
- **Add Comment**
- **Add Like**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

<!-- ## 🚀 Live Demo <a name="live-demo"></a>

- Not available yet

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need to have Rails installed on you computer.

### Setup

Clone this repository to your desired folder:

```sh
  git git@github.com:portfolio-roy/rails-blog.git
  cd rails-blog
```

### Install

Install this project with:

```sh
  bundle install
```

### Usage

It's still in CLI phase. To run the project in command line, first enter rails console by:

```sh
  rails c
```

**Add User example**

```sh
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
   second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
```

**Add Post example**

```sh
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
```

**Add Comment example**

```sh
  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Utsargo Roy**

- GitHub: [@utsargo](https://github.com/utsargo)
- Twitter: [@royutsargo](https://twitter.com/royutsargo)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/utsargo-roy/)

👤 **IBRAHIM DIABY MOHAMED**

- GitHub: [@Dmambo](https://github.com/Dmambo)
- Twitter: [@kingibro345](https://twitter.com/kingibro345)
- LinkedIn: [Dmambo](https://linkedin.com/in/Dmambo)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add user authentication**
- [ ] **Add API endpoints**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please leave a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank my fellow micronauts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
