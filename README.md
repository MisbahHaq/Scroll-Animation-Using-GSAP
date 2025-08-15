# Scroll Reveal Showcase

An animated scroll experience using [GSAP](https://greensock.com/gsap/), [ScrollTrigger](https://greensock.com/scrolltrigger/), [SplitText](https://greensock.com/splittext/), and [Lenis](https://github.com/studio-freight/lenis).  
This project reveals section headings with a **sunrise-style animation**, while **images animate in and out** using dynamic `clip-path` transitions.

---

https://github.com/user-attachments/assets/f3fc9133-333e-4516-ab28-f8012f560d5f

---

## Features

- Smooth scrolling with **Lenis**
- 🎞Scroll-based animations with **GSAP ScrollTrigger**
- “Sunrise-style” text reveal using **clip-path masking**
- 🖼Animated `clip-path` image transitions for entry and exit
- Responsive typography with media queries

---

## How It Works

Each `.work-item` contains:
- A background image (animates via `clip-path`)
- A text container with a **masked heading** that animates upward like a sun rising

The scroll interaction is tied to the vertical position of each section, powered by `ScrollTrigger`.

---
