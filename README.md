# Apex Mind V3

Features:
- iPhone-first responsive interface
- Landing page + authentication UI
- Supabase cloud accounts/database integration
- Local demo fallback
- Advanced trading analytics
- Behavioural score
- AI trade review endpoint
- Vercel-ready API route

## Configure cloud mode
Edit `index.html` CONFIG:
SUPABASE_URL = your Supabase project URL
SUPABASE_KEY = your Supabase publishable/anon key

Run `supabase_schema.sql` in the Supabase SQL Editor. RLS policies restrict users to their own trades.

## Configure AI
In Vercel project environment variables set:
OPENAI_API_KEY = your server-side OpenAI API key
OPENAI_MODEL = a supported Responses API model

Never put an OpenAI secret key in browser JavaScript.

The current AI review is behavioural/process coaching, not financial advice.
