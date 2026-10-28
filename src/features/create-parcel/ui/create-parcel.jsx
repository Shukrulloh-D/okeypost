import { useForm } from 'react-hook-form';
import { z } from 'zod';
import { zodResolver } from '@hookform/resolvers/zod';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select';
const schema = z.object({ track: z.string().min(5, 'Мин 5 символов'), weight: z.string().min(1, 'Укажите вес'), desc: z.string().min(5, 'Мин 5 символов') });
export const CreateParcel = () => {
  const { register, handleSubmit, formState: { errors } } = useForm({ resolver: zodResolver(schema) });
  return (
    <form onSubmit={handleSubmit(() => alert('Посылка создана!'))}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <Input label="Трек-номер" register={register('track')} error={errors.track} />
        <Input label="Вес (кг)" type="number" register={register('weight')} error={errors.weight} />
      </div>
      <Input label="Описание" register={register('desc')} error={errors.desc} />
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
        <Select label="Магазин" options={[{value:'hm', label:'H&M'}, {value:'zara', label:'ZARA'}]} register={register('shop')} />
        <Input label="Стоимость (£)" register={register('price')} />
      </div>
      <Button type="submit" className="mt-4">Создать</Button>
    </form>
  );
};
