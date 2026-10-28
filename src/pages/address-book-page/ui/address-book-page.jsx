import { useForm } from 'react-hook-form';
import { Input } from '@/shared/ui/input';
import { Button } from '@/shared/ui/button';
import { useToastStore } from '@/shared/ui/toast';

export default function AddressBookPage() {
  const { register, handleSubmit, reset } = useForm();
  const addToast = useToastStore((s) => s.addToast);

  const onSubmit = (data) => {
    addToast(`Адрес для "${data.firstname} ${data.lastname}" сохранен!`, 'success');
    reset();
  };

  return (
    <div>
      <h2 className="title-h2 mb-8">Адресная книга пользователя Dmitro Karlov</h2>
      <form onSubmit={handleSubmit(onSubmit)} className="card">
        <div className="grid-3">
          <Input label="Фамилия*" register={register('lastname', { required: true })} />
          <Input label="Имя*" register={register('firstname', { required: true })} />
          <Input label="Страна*" register={register('country')} />
          <Input label="Область*" register={register('region')} />
          <Input label="Район*" register={register('district')} />
          <Input label="Город*" register={register('city')} />
          <Input label="Улица*" register={register('street')} />
          <Input label="Дом*" register={register('house')} />
          <Input label="Квартира*" register={register('flat')} />
          <Input label="Индекс*" register={register('index')} />
          <Input label="Телефон*" register={register('phone')} />
        </div>
        <div className="flex gap-4 mt-6 items-center">
          <Button type="submit">Сохранить</Button>
          <a href="#" className="text-primary-blue font-medium text-sm">+ Добавить новый адрес</a>
        </div>
      </form>
    </div>
  );
}
