-- Run this once in Supabase Dashboard > SQL Editor.
-- Each signed-in user can read and write only their own learning record.

create table if not exists public.study_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.study_state enable row level security;

revoke all on table public.study_state from anon, authenticated;
grant select, insert, update, delete on table public.study_state to authenticated;

drop policy if exists "Read own study state" on public.study_state;
create policy "Read own study state"
on public.study_state for select to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Insert own study state" on public.study_state;
create policy "Insert own study state"
on public.study_state for insert to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Update own study state" on public.study_state;
create policy "Update own study state"
on public.study_state for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

drop policy if exists "Delete own study state" on public.study_state;
create policy "Delete own study state"
on public.study_state for delete to authenticated
using ((select auth.uid()) = user_id);
