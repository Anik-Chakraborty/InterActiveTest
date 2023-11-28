const courseDetails = [
  {
    "id": 1,
    // id needs to be unique
    "courseName": "Introduction to Python Programming",
    "courseDes":
        "A beginner-friendly course to learn the fundamentals of Python programming language.",
    "totalModule": 4,
    "chapters": [1, 2, 2, 3],
    // length of chapter needs to be equal to total Module
    "totalVideo": 8,
    "videoLinks": {
      //'M${moduleNo}C${courseNo}V$videoNo'
      'M0C1V0':
          "https://www.youtube.com/watch?v=7wnove7K-ZQ&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg",
      'M1C1V0':
          "https://www.youtube.com/watch?v=Tto8TS-fJQU&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=2",
      'M1C1V1':
          "https://www.youtube.com/watch?v=xwKO_y2gHxQ&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=3",
      'M2C1V0':
          "https://www.youtube.com/watch?v=7IWOYhfAcVg&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=4",
      'M2C1V1':
          "https://www.youtube.com/watch?v=qxPMmW93eDs&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=5",
      'M3C1V0':
          "https://www.youtube.com/watch?v=ORCuz7s5cCY&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=6",
      'M3C1V1':
          "https://www.youtube.com/watch?v=FLVqcxnJP_E&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=7",
      'M3C1V2':
          "https://www.youtube.com/watch?v=dohaSBCKCr0&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg&index=8",
    }
  },
  {
    "id": 2,
    "courseName": "Web Development with JavaScript and React",
    "courseDes":
        "Explore the world of web development by mastering JavaScript and React framework.",
    "totalModule": 5,
    "chapters": [1, 3, 2, 3, 2],
    "totalVideo": 11,
    "videoLinks": {
      'M0C2V0':
          "https://www.youtube.com/watch?v=tiLWCNFzThE&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ",
      'M1C2V0':
          "https://www.youtube.com/watch?v=UUEJ-AnM_E8&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=2",
      'M1C2V1':
          "https://www.youtube.com/watch?v=Ni5qpL_06VU&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=5",
      'M1C2V2':
          "https://www.youtube.com/watch?v=Y2pA6pz-ffM&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=6",
      'M2C2V0':
          "https://www.youtube.com/watch?v=p9m_v9OxfAM&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=7",
      'M2C2V1':
          "https://www.youtube.com/watch?v=QkGeby03bx8&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=8",
      'M3C2V0':
          "https://www.youtube.com/watch?v=D2skzi8ykHg&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=9",
      'M3C2V1':
          "https://www.youtube.com/watch?v=e8e0T9VBFnU&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=10",
      'M3C2V2':
          "https://www.youtube.com/watch?v=LBpUF-OppB4&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=11",
      'M4C2V0':
          "https://www.youtube.com/watch?v=aZ1Kn6d-b3M&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=12",
      'M4C2V1':
          "https://www.youtube.com/watch?v=s1TAk2SL5vc&list=PLwGdqUZWnOp3aROg4wypcRhZqJG3ajZWJ&index=13",
    }
  },
  {
    "id": 3,
    "courseName": "Data Science Essentials with Python",
    "courseDes":
        "Dive into the field of data science, learning essential tools and techniques using Python.",
    "totalModule": 4,
    "chapters": [3, 2, 2, 3],
    "totalVideo": 10,
    "videoLinks": {
      'M0C3V0':
          "https://www.youtube.com/watch?v=2_6O39UdFi0&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc",
      'M0C3V1':
          "https://www.youtube.com/watch?v=ita82szjz-A&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=2",
      'M0C3V2':
          "https://www.youtube.com/watch?v=feHvG3_POW0&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=3",
      'M1C3V0':
          "https://www.youtube.com/watch?v=KJlHh8mBQyY&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=8",
      'M1C3V1':
          "https://www.youtube.com/watch?v=Dp7mmXLfzD8&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=9",
      'M2C3V0':
          "https://www.youtube.com/watch?v=RYbITgaJYX0&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=10",
      'M2C3V1':
          "https://www.youtube.com/watch?v=IxxGqoOksJ4&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=14",
      'M3C3V0':
          "https://www.youtube.com/watch?v=Y1mXf0rXm04&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=16",
      'M3C3V1':
          "https://www.youtube.com/watch?v=7CCi_aawEKQ&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=20",
      'M3C3V2':
          "https://www.youtube.com/watch?v=CIbJSX-biu0&list=PLiC1doDIe9rCYWmH9wIEYEXXaJ4KAi3jc&index=24",
    }
  },
  {
    "id": 4,
    "courseName": "Machine Learning Fundamentals",
    "courseDes":
        "Gain a solid foundation in machine learning concepts and algorithms for real-world applications.",
    "totalModule": 3,
    "chapters": [1, 2, 3],
    "totalVideo": 6,
    "videoLinks": {
      'M0C4V0':
          "https://www.youtube.com/watch?v=Y4qO9unerGs&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P",
      'M1C4V0':
          "https://www.youtube.com/watch?v=YHcAQKrh3E4&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P&index=2",
      'M1C4V1':
          "https://www.youtube.com/watch?v=1f61P_TQvbk&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P&index=3",
      'M2C4V0':
          "https://www.youtube.com/watch?v=ICCA3-7a5bw&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P&index=4",
      'M2C4V1':
          "https://www.youtube.com/watch?v=vZDDmULsCUU&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P&index=5",
      'M2C4V2':
          "https://www.youtube.com/watch?v=6_YvpI-oDIs&list=PLYwpaL_SFmcBhOEPwf5cFwqo5B-cP9G4P&index=6",
    }
  },
  {
    "id": 5,
    "courseName": "Cyber-security Basics",
    "courseDes":
        "Understand the fundamentals of cyber-security, covering topics like network security and ethical hacking.",
    "totalModule": 5,
    "chapters": [1, 3, 2, 3, 4],
    "totalVideo": 13,
    "videoLinks": {
      'M0C5V0':
          "https://www.youtube.com/watch?v=oKgnYe_6uh8&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb",
      'M1C5V0':
          "https://www.youtube.com/watch?v=_BSlzCjlSMA&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=2",
      'M1C5V1':
          "https://www.youtube.com/watch?v=wliqkrYNIeU&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=3",
      'M1C5V2':
          "https://www.youtube.com/watch?v=Y4VlVIyvOjA&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=4",
      'M2C5V0':
          "https://www.youtube.com/watch?v=dlCe2Jlm0bQ&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=5",
      'M2C5V1':
          "https://www.youtube.com/watch?v=vcw9SJx_wQ8&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=6",
      'M3C5V0':
          "https://www.youtube.com/watch?v=9ay_0dH5ZyA&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=7",
      'M3C5V1':
          "https://www.youtube.com/watch?v=i2c7keFdicw&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=8",
      'M3C5V2':
          "https://www.youtube.com/watch?v=EU-rRBQkGMQ&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=9",
      'M4C5V0':
          "https://www.youtube.com/watch?v=4as6IBafDGY&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=10",
      'M4C5V1':
          "https://www.youtube.com/watch?v=V5f4kqg2Tcs&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=11",
      'M4C5V2':
          "https://www.youtube.com/watch?v=kuiBruZ8U1g&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=12",
      'M4C5V3':
          "https://www.youtube.com/watch?v=_WbtAIEgURc&list=PLWPirh4EWFpEK7BXbMvKDYuHhA4AiYLDb&index=13",
    }
  }
];
