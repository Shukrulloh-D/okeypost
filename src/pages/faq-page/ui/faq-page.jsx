import { useState } from 'react';
import { mockFaq } from '@/shared/mock/data';
import { Search, ChevronDown } from 'lucide-react';
export default function FaqPage() {
  const [open, setOpen] = useState(null);
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <div className="bg-blue-gradient mb-8" style={{ padding: '30px 40px' }}><h1 style={{ fontSize: '28px' }}>Отвечаем на вопросы доставки</h1></div>
      <div style={{ display: 'flex', background: '#fff', padding: 16, borderRadius: 12, border: '1px solid var(--border)', marginBottom: 40 }}><input type="text" placeholder="Поиск..." style={{ flex: 1, border: 'none', outline: 'none' }} /> <Search /></div>
      {mockFaq.map((cat, i) => (
        <div key={i} className="mb-8"><h3 className="mb-4">{cat.category}</h3>{cat.items.map(item => (
          <div key={item.id} style={{ background: '#fff', marginBottom: 8, borderRadius: 8, border: '1px solid var(--border)' }}>
            <div onClick={() => setOpen(open === item.id ? null : item.id)} style={{ padding: 20, display: 'flex', justifyContent: 'space-between', cursor: 'pointer' }}>{item.q} <ChevronDown size={20} /></div>
            {open === item.id && <div style={{ padding: '0 20px 20px', color: 'var(--text-muted)' }}>{item.a}</div>}
          </div>
        ))}</div>
      ))}
      <div className="bg-blue-gradient mt-8" style={{ padding: '40px', borderRadius: '24px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}><h2 style={{ color: '#fff' }}>Остались вопросы?</h2></div>
    </div>
  );
}
