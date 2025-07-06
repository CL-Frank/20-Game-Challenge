# 🎮 20 Game Challenge

Welcome to my **20 Game Challenge**! The goal of this challenge is to design and develop 20 different games as a way to improve my game development skills, explore various genres and mechanics, and have fun in the process. You can find the link to the [**20 Games Challenge Website**](https://20_games_challenge.gitlab.io)

Each game will be listed below with a short description, tech stack used, and a link to the playable version or source code if available.

---

## 📋 Games List

| Game # | Title         | Status     |
|--------|---------------|------------|
| 1      | Flappy Bird           | ✅ Completed |
| 2      | Breakout           | ✅ Completed |
| 3      | Frogger           | 🔲 Planned |
| 4      | Indy 500           | 🔲 Planned |
| 5      | Conway's Game of Life           | 🔲 Planned |
| More To Come|
---

##  Completed Games

### 🐦 Game 1: Flappy Bird Clone
A simple clone of the classic Flappy Bird game. Tap or click to keep the bird in the air and avoid obstacles. The game gets faster as you play and so becomes more difficult.  
**Things I learned:**
- Taught me the basics of navigating the Godot Engine
- Using 2D nodes to create scenes, spawning and deleting objects   

**Tech Stack**: Godot Engine  

**Source Code**: [Game 1: Flappy Bird](./game_1_flappy_bird/)  
**Date Completed** : 03 July 2025

**Play here**: *https://cl-frank.itch.io/20-g1-flappy-bird*  

#### Challenge Goals
✔ Create a game world with a floor.  
✔ Add an object that represents the main character. Apply a constant force to the character so it falls to the floor.  
✔ Add obstacles on the right of the game area. The obstacles should slide across the screen toward the left. The obstacles will appear in pairs, with a vertical gap between them.  
✔ Detect when the character collides with the floor or obstacles, and reset the game when a collision occurs.  
✔ Accumulate one point for each obstacle that the player passes. Display the score.  

#### ✨ Possible Features to Add
- Sound effects for flapping, dying, increasing score
- Background music loop
- Animated background (parallax scrolling)
- Particle effects when passing pipes or dying
- High score saving
- Pause and resume functionality
- Sprites for visuals
- Mobile Support

---
### 🧱 Game 2: Breakout Clone
A classic Breakout-style game where you control a paddle to bounce a ball and destroy bricks.  
The original game had eight rows of 16 bricks each, though you can change the number of bricks depending on the size of the game space.
**Things I learned:** 
- Making use of signals to control game states and conditions across scenes
- Controlling rigid bodies  
**Tech Stack**: Godot Engine   

**Source Code**: [Game 2: Breakout](./game_2_breakout/)  
**Date Completed** : 06 July 2025 

**Play here**: *https://cl-frank.itch.io/20-g2-breakout*  

#### Challenge Goals
✔Create a game space with walls and a ceiling.  
✔Add a paddle that can be moved left and right via player inputs.  
✔Add a ball that will bounce off of the paddle, walls, and ceiling.  
✔Add square game objects (bricks) into the top of the game space.  
✔Enable the ball to bounce off of the bricks. When the ball bounces, the brick should disappear.  
✔Breaking a brick should add to the player’s score.  
✔The ball’s speed should increase as bricks are broken.  
✔The score should be displayed, as well as a life counter. The player starts with three lives. If the player misses the ball, a life should be subtracted. When all lives are used, the game ends.  



#### ✨ Possible Features to Add
- Power-ups (multi-ball, wider paddle, lasers)  
- Sound effects and background music  
- Level transitions or multiple brick layouts  
- Brick hit animations or particle effects  
- Combo system   
- Paddle control via mouse input
- Custom Sprites for visuals
- Mobile Support

---

## 🧠 Goals for This Challenge
- Build experience with different gameplay mechanics
- Practice level design and polish
- Improve asset integration and UI design
- Learn to finish and publish projects

---

## 🛠 Tools I Use
- **Game Engine**: Godot
- **Art Tools**: Aseprite
- **Sound**: N/A
- **Version Control**: Git + GitHub

---

## 💬 Feedback
Feel free to try out the games and leave feedback or suggestions via [Issues](https://github.com/CL-Frank/20-Game-Challenge/issues)!

---

## 📅 Progress Log
I'll update this README as I complete each game, with notes on what I learned and what challenges I faced.
