document.addEventListener("DOMContentLoaded", () => {
    gsap.registerPlugin(ScrollTrigger, SplitText);

    const lenis = new Lenis();
    lenis.on("scroll", ScrollTrigger.update);

    function raf(time) {
        lenis.raf(time);
        requestAnimationFrame(raf);
    }
    requestAnimationFrame(raf);

    gsap.ticker.lagSmoothing(0);

    gsap.utils.toArray(".work-item").forEach((item) => {
        const nameH1 = item.querySelector(".work-item-name h1");
        const img = item.querySelector(".work-item-img"); // ✅ FIXED: Now img is defined

        // SplitText setup
        const split = new SplitText(nameH1, {
            type: "chars",
            charsClass: "char",
        });

        gsap.set(split.chars, { y: "125%" });

        split.chars.forEach((char, index) => {
            ScrollTrigger.create({
                trigger: item,
                start: `top+=${index * 25 - 250} top`,
                end: `top+=${index * 25 - 100} top`,
                scrub: 1,
                animation: gsap.fromTo(
                    char,
                    { y: "125%" },
                    { y: "0%", ease: "none" }
                ),
            });
        });

        // Animate image clip path
        ScrollTrigger.create({
            trigger: item,
            start: "top bottom",
            end: "top top",
            scrub: 0.5,
            animation: gsap.fromTo(
                img,
                {
                    clipPath: "polygon(25% 25%, 75% 40%, 100% 100%, 0% 100%)",
                },
                {
                    clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
                    ease: "none",
                }
            ),
        });

        ScrollTrigger.create({
            trigger: item,
            start: "bottom bottom",
            end: "bottom top",
            scrub: 0.5,
            animation: gsap.fromTo(
                img, {
                clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
            }, {
                clipPath: "polygon(0% 0%, 100% 0%, 75% 60%, 25% 75%)",
                ease: "none"
            }
            )
        });
    });
});
