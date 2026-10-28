import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select';
export const Calculator = () => {
  const [price, setPrice] = useState(null);
  const { register, handleSubmit } = useForm();
  return (
    <div style={{ background: '#fff', padding: '24px', borderRadius: '16px', border: '1px solid var(--border)' }}>
      <form onSubmit={handleSubmit((d) => setPrice(Math.round(500 + (d.weight || 0) * 200)))}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr 1fr', gap: '16px', alignItems: 'end' }}>
          <Select label="Страна" options={[{value:'ru', label:'Россия'}]} register={register('country')} />
          <Input label="Город" placeholder="Москва" register={register('city')} />
          <Input label="Индекс" placeholder="Введите индекс" register={register('index')} />
          <Input label="Вес посылки" type="number" placeholder="0.5" register={register('weight')} />
          <Select label="Доп. услуги" options={[{value:'none', label:'Выберите услуги'}]} register={register('services')} />
        </div>
        <Button type="submit" className="mt-4">Рассчитать</Button>
      </form>
      {price && <div className="mt-4" style={{ color: 'var(--primary-green)', fontSize: '24px', fontWeight: 'bold' }}>Стоимость: {price} ₽</div>}
    </div>
  );
};
