import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
import './faq-page.css';
 
export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper faq-wrapper">
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Отвечаем на вопросы доставки</h1></div>
      
      <div className="faq-search">
        <input type="text" placeholder="Поиск по вопросам и ответам..." />
        <Search size={24} color="var(--primary-blue)"/>
      </div>
      
      {mockFaq.map((cat, i) => (
        <div key={i} className="faq-category">
          <h3>{cat.category}</h3>
          {cat.items.map(item => (
            <div key={item.id} className="faq-item">
              <div onClick={() => setOpen(open === item.id ? null : item.id)} className="faq-q">
                {item.q} <ChevronDown size={20} className={open === item.id ? 'rotate' : ''}/>
              </div>
              {open === item.id && <div className="faq-a">{item.a}</div>}
            </div>
          ))}
        </div>
      ))}

      <div className="bg-blue-gradient mt-8 cta-bottom">
        <h2>Остались вопросы? Спросите нас в соцсетях!</h2>
        <div style={{display:'flex', gap: 16}}>
          <img src="/images/icons/whatsapp.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
          <img src="/images/icons/telegram.png" style={{width: 40}} onError={(e)=>e.target.style.display='none'}/>
        </div>
      </div>
    </div>
  );
}
