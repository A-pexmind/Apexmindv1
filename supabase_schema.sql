-- Apex Mind V3 Supabase schema
create table if not exists public.trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  trade_date timestamptz not null,
  instrument text not null,
  side text not null,
  setup text not null,
  session text,
  lots numeric,
  entry numeric,
  sl numeric,
  tp numeric,
  risk numeric,
  result text not null,
  r numeric not null,
  pnl numeric not null,
  confidence numeric,
  emotion text,
  plan text,
  impulse text,
  notes text,
  created_at timestamptz not null default now()
);

alter table public.trades enable row level security;

create policy "Users can view their own trades"
on public.trades for select
to authenticated
using (auth.uid() = user_id);

create policy "Users can insert their own trades"
on public.trades for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update their own trades"
on public.trades for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users can delete their own trades"
on public.trades for delete
to authenticated
using (auth.uid() = user_id);

create index if not exists trades_user_date_idx
on public.trades(user_id, trade_date desc);
