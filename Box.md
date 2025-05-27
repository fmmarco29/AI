<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Animaciones CSS Cheat Sheet</title>
<style>
  /* 🎯 1. Fade In */
  .fade-in {
    animation: fadeIn 2s ease-in-out forwards;
  }
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  /* 🎯 2. Slide In */
  .slide-in {
    animation: slideIn 2s ease forwards;
  }
  @keyframes slideIn {
    from { transform: translateX(-100%); }
    to { transform: translateX(0); }
  }

  /* 🎯 3. Scale */
  .scale-up {
    animation: scaleUp 1.5s ease-out forwards;
  }
  @keyframes scaleUp {
    from { transform: scale(0.5); }
    to { transform: scale(1); }
  }

  /* 🎯 4. Rotate */
  .rotate {
    animation: rotate360 2s linear infinite;
  }
  @keyframes rotate360 {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
  }

  /* 🎯 5. Pulse */
  .pulse {
    animation: pulse 2s infinite alternate;
  }
  @keyframes pulse {
    from { transform: scale(1); opacity: 1; }
    to { transform: scale(1.2); opacity: 0.7; }
  }

  /* 🎯 6. Bounce */
  .bounce {
    animation: bounce 1.5s infinite;
  }
  @keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
  }

  /* 🎯 7. Color Change */
  .color-change {
    animation: colorChange 3s infinite alternate;
  }
  @keyframes colorChange {
    from { background-color: #4caf50; }
    to { background-color: #2196f3; }
  }

  /* ⚡️ Estilo general para cajas de animación */
  .box {
    width: 120px;
    height: 120px;
    margin: 20px;
    background-color: #4caf50;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    border-radius: 8px;
  }

  /* 🌟 Layout sencillo de demostración */
  .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }

  h1 {
    text-align: center;
  }
</style>
</head>
<body>
  <h1>CSS Animations Cheat Sheet</h1>
  <div class="container">
    <div class="box fade-in">Fade</div>
    <div class="box slide-in">Slide</div>
    <div class="box scale-up">Scale</div>
    <div class="box rotate">Rotate</div>
    <div class="box pulse">Pulse</div>
    <div class="box bounce">Bounce</div>
    <div class="box color-change">Color</div>
  </div>
</body>
</html>
