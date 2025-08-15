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

        // Correct usage of SplitText
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
    });
});
