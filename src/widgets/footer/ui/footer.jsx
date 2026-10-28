import { Link } from 'react-router-dom';
import './footer.css';
export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-grid">
        <div>
          <h2 style={{color: 'var(--primary-blue)', fontWeight: 800, marginBottom: 16}}>OkeyPost</h2>
          <div style={{display: 'flex', gap: 16, color: 'var(--text-muted)'}}>
            <a href="#">WhatsApp</a> <a href="#">Telegram</a> <a href="#">Viber</a>
          </div>
        </div>
        <div>
          <h4>О компании</h4>
          <Link to="/">Услуги</Link>
          <Link to="/">Цены</Link>
          <Link to="/">Отзывы</Link>
          <Link to="/">Контакты</Link>
          <Link to="/">Вакансии</Link>
          <Link to="/">Соглашение о персональных данных</Link>
          <Link to="/">Условия использования</Link>
        </div>
        <div>
          <h4>Полезное</h4>
          <Link to="/">Как работает наш сервис</Link>
          <Link to="/">Как покупать с оператором</Link>
          <Link to="/">Ответы на частые вопросы</Link>
          <Link to="/">Популярные магазины</Link>
          <Link to="/">Черный список магазинов</Link>
          <Link to="/">Актуальные распродажи</Link>
        </div>
        <div>
          <h4>Спецпроекты</h4>
          <Link to="/">50% на первую доставку</Link>
          <Link to="/">Скидки для постоянных клиентов</Link>
          <Link to="/">Реферальная программа</Link>
          <Link to="/">Кэшбек Mr. Rebates и Rakuten</Link>
          <Link to="/">Stop Fraud</Link>
        </div>
      </div>
      <div className="container footer-bottom">
        <p>© 2022 OkeyPost. Все права защищены.</p>
      </div>
    </footer>
  );
}
