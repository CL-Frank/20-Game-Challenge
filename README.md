# 🎮 20 Game Challenge
<!---
🔲 ✅ ⚒️
--->

Welcome to my **20 Game Challenge**! The goal of this challenge is to design and develop 20 different games as a way to improve my game development skills, explore various genres and mechanics, and have fun in the process. You can find the link to the [**20 Games Challenge Website**](https://20_games_challenge.gitlab.io)

Each game will be listed below with a short description, tech stack used, and a link to the playable version or source code if available.

---

## 📋 Games List

| Game # | Title         | Status     |
|--------|---------------|------------|
| 1      | Flappy Bird           | ✅ Completed |
| 2      | Breakout           | ✅ Completed |
| 3      | Frogger           | ✅ Completed |
| 4      | Asteroids           | ✅ Completed |
| 5      | Pac-Man           | 🔲 Planned |
| More To Come|
---

##  Completed Games

### 🐦 Game 1: Flappy Bird Clone

A simple clone of the classic *Flappy Bird* game. Click or tap to keep the bird airborne while avoiding incoming obstacles. The game gradually increases in speed, raising the difficulty over time.
Overall very simple game, mechanic wise and visually.

**Date Completed**: 03 July 2025  
**Engine / Framework**: Godot Engine  
**Platform**: Web (HTML5)  

**Play Here**: [https://cl-frank.itch.io/20-g1-flappy-bird](https://cl-frank.itch.io/20-g1-flappy-bird)  
**Source Code**: ./game_1_flappy_bird/  

---

#### 🧠 What I Learned

* Navigating the Godot Engine editor and scene workflow  
* Building scenes using Godot 2D nodes  
* Applying physics forces to characters  
* Runtime spawning and cleanup of obstacles  
* Collision detection and game state resets  

---
| 🛠️ Core Features (Implemented) | 📋 Original Challenge Goals |
|-------------------------------|-----------------------------|
| ✔ Physics-based player movement with gravity  | ✔ Create a game world with a floor |
| ✔ Procedural obstacle spawning with variable gaps   | ✔ Add a gravity-affected character |
| ✔ Collision detection and game reset logic    | ✔ Spawn paired moving obstacles |
| ✔ Scoring system triggered by obstacle traversal                 | ✔ Track and display score |
||✔ Detect collisions and reset the game|

---

#### ✨ Possible Improvements

* Audio: sound effects for flapping, scoring, and dying
* Music: looping background track
* Visuals: parallax scrolling background and animated sprites
* Effects: particle effects when scoring or colliding
* Systems: high score saving and pause/resume functionality
* Platform: improved mobile support

---

#### 🖼️ Screenshots
<img width="389" height="261" alt="flappy_bird_01" src="https://github.com/user-attachments/assets/e86b3e50-4ed4-4cd2-bcc8-72c738dfe751" />


---
### 🧱 Game 2: Breakout Clone

My early take on the classic *Breakout* arcade game. Control a paddle to keep the ball in play, destroy bricks, and manage lives as the ball accelerates with each successful hit.

**Date Completed**: 06 July 2025  
**Engine / Framework**: Godot Engine  
**Platform**: Web (HTML5)  

**Play Here**: [https://cl-frank.itch.io/20-g2-breakout](https://cl-frank.itch.io/20-g2-breakout)  
**Source Code**: ./game_2_breakout/  

---

#### 🧠 What I Learned

* Using Godot signals to manage game states across multiple scenes
* Controlling and configuring rigid bodies for predictable physics behavior
* Handling collision responses between multiple dynamic objects
* Managing score, lives, and game-over conditions

---

#### 🛠️ Features vs 📋 Original Challenge Goals

| 🛠️ Core Features (Implemented)              | 📋 Original Challenge Goals                    |
| -------------------------------------------- | ---------------------------------------------- |
| ✔ Paddle movement via player input           | ✔ Create a game space with walls and a ceiling |
| ✔ Physics-based ball with collision response | ✔ Add a paddle that moves left and right       |
| ✔ Brick destruction with score increment     | ✔ Enable the ball to bounce off bricks         |
| ✔ Increasing ball speed as bricks are broken | ✔ Increase ball speed over time                |
| ✔ Score and life tracking system             | ✔ Display score and life counter               |
| ✔ Game-over state when lives are depleted    | ✔ End the game when all lives are used         |

---

#### ✨ Possible Improvements

* Power-ups (multi-ball, wider paddle, lasers)
* Sound effects and background music
* Multiple levels or varied brick layouts
* Brick hit animations or particle effects
* Combo or streak-based scoring system
* Mouse-based paddle control option
* Custom sprites for improved visuals
* Mobile support

---

#### 🖼️ Screenshots


<img width="389" height="261" alt="breakout_01" src="https://github.com/user-attachments/assets/edfdfc9b-56d6-43fd-891d-2c038318e158" />



---
### 🐸 Game 3: Frogger Clone

A faithful clone of the 1981 arcade classic *Frogger*. Guide the frog across busy roads and dangerous rivers using grid-based movement, avoiding cars, water hazards, and wildlife to safely reach all five homes at the top of the screen.

**Date Completed**: 01 December 2025  
**Engine / Framework**: Godot Engine  
**Platform**: Web (HTML5)  

**Play Here**: [https://cl-frank.itch.io/game3-frogger-clone](https://cl-frank.itch.io/game3-frogger-clone)  
**Source Code**: ./game_3_frogger/  

---

#### 🧠 What I Learned

* Implementing grid-based movement with discrete player actions
* Moving the player using dynamic platforms (logs, turtles)
* Designing lane-based level layouts with varying behaviors
* Creating and integrating pixel art assets
* Implementing basic animations and death effects

---

#### 🛠️ Features vs 📋 Original Challenge Goals

| 🛠️ Core Features (Implemented)                          | 📋 Original Challenge Goals                      |
| -------------------------------------------------------- | ------------------------------------------------ |
| ✔ Grid-based hopping movement system                     | ✔ Frog moves one tile per button press           |
| ✔ Multi-lane level with road, water, and safe zones      | ✔ Create lanes for roads, rivers, and safe areas |
| ✔ Cars with lane-specific speeds and patterns            | ✔ Unique car patterns and speeds per lane        |
| ✔ Moving platforms (logs, turtles) that carry the player | ✔ Platforms move horizontally across water lanes |
| ✔ Hazard interactions (cars, water, animals)             | ✔ Player dies from collisions or drowning        |
| ✔ Crocodiles and diving turtles as advanced hazards      | ✔ Add dangerous river obstacles                  |
| ✔ Lily pad goal tracking and level completion logic      | ✔ Fill all five lillypads to complete the level  |
| ✔ UI with score and life counter                         | ✔ Display score and remaining lives              |
| ✔ Animated death effects for player feedback             | ✔ Add animation or particle effect on death      |

---

#### ✨ Possible Improvements

* Pause menu and in-game settings
* Additional levels with increased difficulty
* Improved animations and visual polish
* Enhanced sound effects and background music

---

#### 🖼️ Screenshots

<img width="320" height="640" alt="frogger_01" src="https://github.com/user-attachments/assets/a252059b-b4e0-4a1f-b07a-bd37d6072e55" />
<img width="374" height="270" alt="frogger_02" src="https://github.com/user-attachments/assets/52af32ea-aa4a-4cab-bf4e-76260f759224" />


---
### ☄️ Game 4: Asteroids Clone

A modern clone of the classic *Asteroids* arcade game. Pilot a ship in open space, rotate and thrust with inertia-based movement, shoot incoming asteroids, and survive as larger asteroids fragment into smaller, faster threats.

**Date Completed**: *24 Decemeber 2-25*  
**Engine / Framework**: Godot Engine  
**Platform**: Web (HTML5)  

**Play Here**: *[(https://cl-frank.itch.io/game-4-asteroids)](https://cl-frank.itch.io/game-4-asteroids)*  
**Source Code**: ./game_4_asteroids/

---

#### 🧠 What I Learned

* Applying **composition over inheritance** for flexible, reusable gameplay systems
* Designing loosely coupled components using Godot signals
* Implementing inertia-based movement and rotation mechanics
* Managing entity lifecycles (spawning, splitting, despawning)
* Applying core game design principles for difficulty scaling and player feedback

---

#### 🛠️ Features vs 📋 Original Challenge Goals

| 🛠️ Core Features (Implemented)                         | 📋 Original Challenge Goals                        |
| ------------------------------------------------------- | -------------------------------------------------- |
| ✔ Player ship with rotation and thrust-based movement   | ✔ Create a ship that rotates and thrusts forward   |
| ✔ Directional shooting system with timed bullet cleanup | ✔ Fire bullets in the ship’s facing direction      |
| ✔ Three asteroid sizes with fragmentation logic         | ✔ Create three sizes of asteroids                  |
| ✔ Asteroids split into smaller pieces when destroyed    | ✔ Break asteroids into smaller asteroids when shot |
| ✔ Player life system with collision handling            | ✔ Lose a life on player–asteroid collision         |
| ✔ Continuous screen wrapping for all entities           | ✔ Enable screen wrapping                           |
| ✔ UI menus, score display, and game states              | ✔ Add menus and UI                                 |
| ✔ Sound effects and particle-based explosions           | ✔ Add sound and particle effects                   |

---

#### ✨ Possible Improvements

* Performance: object pooling for bullets and asteroids
* Architecture: event bus pattern for decoupled communication
* Configuration: external config files for tuning gameplay values
* Structure: separate UI management from core game logic
* Stability: improved error handling and edge-case coverage
* Code quality: consistent null checks and scene path validation
* Maintainability: clearer code documentation and comments

---

#### 🖼️ Screenshots
<img width="374" height="270" alt="Screenshot 2025-12-24 110114" src="https://github.com/user-attachments/assets/22056948-47d1-488b-95c9-0466fe862102" />

**

## 🛠 Tools I Use
- **Game Engine**: Godot
- **Art Tools**: Aseprite
- **Sound Tools**: Audacity
- **Version Control**: Git + GitHub
- **Use of AI**: I will be using AI as a tool, but not to create any asset or code

---

## 💬 Feedback
Feel free to try out the games and leave feedback or suggestions via [Issues](https://github.com/CL-Frank/20-Game-Challenge/issues)!

---

## 📅 Progress Log
I'll update this README as I complete each game, with notes on what I learned and what challenges I faced.
