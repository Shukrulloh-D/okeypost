#!/bin/bash
echo "🎨 Глобальная настройка стилей под Figma (расширяем и увеличиваем)..."

# 1. ГЛОБАЛЬНЫЕ СТИЛИ (Растягиваем контейнер и увеличиваем шрифты)
cat > src/app/styles/global.css << 'END'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --bg-main: #F5F7FA; --bg-card: #FFFFFF;
  --primary-blue: #40B8EA; --primary-purple: #5B52A3; --primary-green: #00B33B;
  --text-main: #1A1A1A; --text-muted: #8A8A8A; --border: #E0E0E0;
  --font: 'Inter', sans-serif;
}
* { box-sizing: border-box; margin: 0; padding: 0; }
body { background: var(--bg-main); font-family: var(--font); color: var(--text-main); -webkit-font-smoothing: antialiased; }
a { text-decoration: none; color: inherit; }
ul { list-style: none; }
button { cursor: pointer; font-family: inherit; border: none; background: none; }

/* САМОЕ ВАЖНОЕ: Расширяем контейнер до 1600px, как в Figma */
.container { max-width: 1600px; margin: 0 auto; padding: 0 40px; }
.text-center { text-align: center; }
.mt-4 { margin-top: 16px; } .mt-8 { margin-top: 40px; } .mb-4 { margin-bottom: 16px; } .mb-8 { margin-bottom: 40px; }

/* Увеличиваем заголовки */
.title-h1 { font-size: 48px; font-weight: 700; line-height: 1.1; }
.title-h2 { font-size: 36px; font-weight: 700; line-height: 1.2; }
.text-muted { color: var(--text-muted); font-size: 16px; }
.page-wrapper { padding-top: 60px; padding-bottom: 100px; min-height: 70vh; }
END

# 2. СТИЛИ ГЛАВНОЙ СТРАНИЦЫ (Hero, категории, куртка, шаги)
cat > src/pages/home-page/ui/home-page.css << 'END'
/* HERO БАННЕР */
.hero-banner { background: linear-gradient(135deg, #5B52A3, #40B8EA); border-radius: 36px; padding: 100px 80px; color: #fff; display: flex; justify-content: space-between; align-items: center; min-height: 600px; overflow: hidden; margin-bottom: 60px;}
.hero-text { max-width: 600px; z-index: 2; }
.hero-text h1 { font-size: 64px; line-height: 1.1; font-weight: 700; margin-bottom: 24px; }
.hero-text p { font-size: 18px; line-height: 1.5; opacity: 0.9; max-width: 500px; }
.hero-img { width: 500px; display: flex; justify-content: center; }
.hero-img img { max-width: 100%; height: auto; object-fit: contain; }

/* КАТЕГОРИИ */
.category-strip { display: flex; justify-content: space-between; background: #fff; padding: 32px 40px; border-radius: 24px; border: 1px solid var(--border); overflow-x: auto; margin-bottom: 60px; }
.category-item { display: flex; flex-direction: column; align-items: center; gap: 16px; min-width: 120px; cursor: pointer; transition: 0.2s; }
.category-item:hover { transform: translateY(-5px); color: var(--primary-blue); }
.category-item svg { width: 40px; height: 40px; }
.category-item span { font-size: 16px; font-weight: 500; }

/* СРАВНЕНИЕ ЦЕН (КУРТКА) */
.price-compare-card { display: flex; justify-content: space-between; align-items: center; background: #fff; padding: 60px; border-radius: 36px; margin-bottom: 40px; border: 1px solid var(--border); }
.compare-left, .compare-right { flex: 1; }
.compare-left h3, .compare-right h3 { font-size: 24px; font-weight: 600; line-height: 1.3;}
.compare-center { width: 300px; height: 300px; background: #F5F7FA; border-radius: 50%; display: flex; align-items: center; justify-content: center; position: relative; }
.compare-center img { max-width: 120%; transform: scale(1.1); object-fit: contain; }
.price-box { display: flex; align-items: center; gap: 16px; background: #F5F7FA; padding: 16px 24px; border-radius: 16px; width: fit-content; }
.price-box b { font-size: 20px; }
.flag { font-size: 32px; }

/* ПРЕИМУЩЕСТВА */
.benefits-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 60px;}
.benefit-card { background: #fff; padding: 32px; border-radius: 24px; display: flex; align-items: flex-start; gap: 20px; border: 1px solid var(--border); }
.benefit-card h4 { font-size: 16px; font-weight: 600; margin-bottom: 8px;}

/* ДОСТАВКА (ТАБЛИЦА) */
.delivery-list { display: flex; flex-direction: column; gap: 16px; margin-bottom: 60px;}
.delivery-row { display: flex; align-items: center; background: #fff; padding: 32px; border-radius: 20px; border: 1px solid var(--border); }
.del-left { flex: 2; display: flex; align-items: center; gap: 16px; font-size: 18px;}
.del-mid { flex: 1; font-size: 16px; }
.del-right { flex: 1; text-align: right; font-size: 18px; }

/* 4 ШАГА */
.steps-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px; margin-bottom: 80px;}
.step-item { text-align: left; }
.step-circle { width: 48px; height: 48px; background: var(--primary-blue); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 24px; margin-bottom: 20px; }
.step-item h4 { font-size: 16px; margin-bottom: 12px; text-transform: uppercase; font-weight: 700;}
.step-item p { font-size: 15px; line-height: 1.5;}

/* ОТЗЫВЫ */
.reviews-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; margin-bottom: 40px;}
.review-card { background: #fff; padding: 32px; border-radius: 24px; display: flex; gap: 24px; border: 1px solid var(--border); }
.review-card h4 { font-size: 18px; margin-bottom: 8px;}
.review-card p { font-size: 15px; margin-bottom: 16px;}

/* ПОДПИСКА */
.subscribe-banner { background: linear-gradient(90deg, #5B52A3, #40B8EA); padding: 60px 80px; border-radius: 36px; display: flex; justify-content: space-between; align-items: center; }

@media (max-width: 1200px) {
  .hero-text h1 { font-size: 48px; }
  .hero-banner { flex-direction: column; padding: 60px 40px; text-align: center; min-height: auto; }
  .hero-img { margin-top: 40px; width: 100%; }
  .category-strip { flex-wrap: wrap; justify-content: center; gap: 30px; }
  .price-compare-card { flex-direction: column; gap: 40px; text-align: center; padding: 40px; }
  .price-box { margin: 0 auto; }
  .benefits-grid { grid-template-columns: 1fr 1fr; }
  .delivery-row { flex-direction: column; align-items: flex-start; gap: 16px; }
  .del-right { text-align: left; }
  .steps-grid { grid-template-columns: 1fr 1fr; }
  .reviews-grid { grid-template-columns: 1fr; }
  .subscribe-banner { flex-direction: column; gap: 30px; text-align: center; padding: 40px; }
}
END

echo "✅ Стили Главной страницы обновлены (теперь они огромные и широкие)!"
