#!/bin/bash

# 🚀 Скрипт для автоматического деплоя на GitHub Pages

echo "🧭 JETI - Деплой туристического гида по Актау"
echo "==============================================="

# Проверяем наличие Git
if ! command -v git &> /dev/null; then
    echo "❌ Git не установлен. Установите Git для продолжения."
    exit 1
fi

# Проверяем инициализирован ли Git репозиторий
if [ ! -d ".git" ]; then
    echo "📦 Инициализируем Git репозиторий..."
    git init
    echo "✅ Git репозиторий инициализирован"
fi

# Добавляем все файлы
echo "📁 Добавляем файлы в Git..."
git add .

# Запрашиваем сообщение коммита
read -p "💬 Введите сообщение коммита (или нажмите Enter для стандартного): " commit_message
if [ -z "$commit_message" ]; then
    commit_message="Update JETI tourist guide - $(date +%Y-%m-%d)"
fi

# Создаем коммит
git commit -m "$commit_message"

# Проверяем наличие remote origin
if ! git remote get-url origin &> /dev/null; then
    echo "🔗 Добавьте удаленный репозиторий:"
    read -p "Введите URL репозитория GitHub (https://github.com/username/repo.git): " repo_url
    git remote add origin "$repo_url"
fi

# Отправляем на GitHub
echo "🚀 Отправляем на GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ Деплой завершен!"
echo "🌐 Ваш сайт будет доступен через 5-10 минут по адресу:"
echo "   https://username.github.io/repository-name"
echo ""
echo "📖 Подробные инструкции в файле: deploy-instructions.md"