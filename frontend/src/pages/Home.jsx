import { useEffect, useState } from "react";
 
function Home() {

    const [backendMessage, setBackendMessage] = useState("");
 
 useEffect(() => {
    const protocol = window.location.protocol; // 'http:' or 'https:'
    const hostname = window.location.hostname;
    const apiUrl = `${protocol}//${hostname}:5000/api/message`;

    fetch(apiUrl)
      .then((res) => res.json())
      .then((data) => {
        setBackendMessage(data.status);
      })
      .catch((err) => {
        console.error("Backend connection error:", err);
        setBackendMessage("Disconnected");
      });
  }, []);

  useEffect(() => {
    const targetDate = new Date("2025-12-31T00:00:00").getTime();
 
    const timer = setInterval(() => {
      const now = new Date().getTime();
      const diff = targetDate - now;
 
      if (diff < 0) return clearInterval(timer);
 
      document.getElementById("days").innerText = Math.floor(diff / (1000 * 60 * 60 * 24));
      document.getElementById("hours").innerText = Math.floor((diff / (1000 * 60 * 60)) % 24);
      document.getElementById("minutes").innerText = Math.floor((diff / (1000 * 60)) % 60);
      document.getElementById("seconds").innerText = Math.floor((diff / 1000) % 60);
    }, 1000);
  }, []);
 
  return (
<div>
<div className="hero">
<div className="hero-content">
<h1 className="main-title">Foundation Day</h1>

<p style={{ color: "lime", marginTop: "10px", fontWeight: "bold" }}>
  Backend Status: {backendMessage}
</p>

<p className="subtitle">Celebrating Our Journey & Achievements</p>
<div className="date-badge">
<span className="date">31 December 2025</span>
</div>
</div>
 
        <div className="floating-elements">
<span className="confetti confetti-1">🎉</span>
<span className="confetti confetti-2">✨</span>
<span className="confetti confetti-3">🎊</span>
<span className="confetti confetti-4">⭐</span>
</div>
</div>
 
      <div className="container content">
<section className="about">
<h2>About The Event</h2>
<p>
            Our Foundation Day marks a milestone in our journey, celebrating
            our achievements, teamwork, and vision for the future.
</p>
</section>
 
        <section className="highlights">
<h2>Event Highlights</h2>
<div className="highlight-grid">
<div className="highlight-card">
<div className="icon">🏆</div>
<h3>Awards</h3>
<p>Recognizing excellence and dedication.</p>
</div>
 
            <div className="highlight-card">
<div className="icon">🎤</div>
<h3>Speeches</h3>
<p>Inspiring words from leaders.</p>
</div>
 
            <div className="highlight-card">
<div className="icon">🎶</div>
<h3>Performances</h3>
<p>Cultural & musical celebrations.</p>
</div>
</div>
</section>
 
        <section className="countdown">
<h2>Countdown Begins</h2>
<div className="countdown-timer">
<div className="time-unit">
<span className="number" id="days">0</span>
<span className="label">Days</span>
</div>
<div className="time-unit">
<span className="number" id="hours">0</span>
<span className="label">Hours</span>
</div>
<div className="time-unit">
<span className="number" id="minutes">0</span>
<span className="label">Minutes</span>
</div>
<div className="time-unit">
<span className="number" id="seconds">0</span>
<span className="label">Seconds</span>
</div>
</div>
<p className="celebration-message">Let the celebration begin! 🎉</p>
</section>
 
        <footer className="footer">
<div className="footer-content">
<p>© 2025 Foundation Day Celebration</p>
<div className="social-links">
<span>🌐</span>
<span>📘</span>
<span>📸</span>
</div>
</div>
</footer>
</div>
</div>
  );
}
 
export default Home;