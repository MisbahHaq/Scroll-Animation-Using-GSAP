document.addEventListener("DOMContentLoaded", () => {
    gsap.registerPlugin(ScrollTrigger);

    const lenis = new Lenis();
    lenis.on("scroll", ScrollTrigger.update);

    function raf(time) {
        lenis.raf(time);
        requestAnimationFrame(raf);
    }
    requestAnimationFrame(raf);

    gsap.ticker.lagSmoothing(0);

    gsap.utils.toArray(".work-item").forEach((item) => {
        const img = item.querySelector(".work-item-img");
        const textReveal = item.querySelector(".text-reveal");

        // Animate the clip-path of the text container
        ScrollTrigger.create({
            trigger: item,
            start: "top center",
            end: "top top",
            scrub: 1,
            animation: gsap.to(textReveal, {
                clipPath: "inset(0% 0% 0% 0%)",
                ease: "power2.out",
            }),
        });

        // Animate image entrance
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

        // Animate image exit
        ScrollTrigger.create({
            trigger: item,
            start: "bottom bottom",
            end: "bottom top",
            scrub: 0.5,
            animation: gsap.fromTo(
                img,
                {
                    clipPath: "polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)",
                },
                {
                    clipPath: "polygon(0% 0%, 100% 0%, 75% 60%, 25% 75%)",
                    ease: "none",
                }
            ),
        });
    });
});
