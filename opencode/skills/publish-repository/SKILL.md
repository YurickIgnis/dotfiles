---
name: publish-repository
description: Publica cambios de forma segura por develop, release y master, validando sincronización, pruebas, identidad y conflictos.
---

# Publicar repositorio

Usar para repositorios con el flujo `develop -> release -> master`.

## Reglas de seguridad

- No descartar cambios ajenos ni usar `reset --hard` o force-push.
- No publicar si hay divergencias, conflictos o validaciones fallidas.
- No incluir secretos, archivos `.env`, llaves, dumps ni datos de producción.
- No ejecutar cambios de datos en producción.

## Procedimiento

### 1. Revisar el repositorio

Ejecutar:

```bash
pwd
git status --short --branch
git diff --stat
git log --oneline --decorate -5 --all
git remote -v
git config user.name
git config user.email
```

Confirmar repositorio, remoto, rama y archivos modificados. Tratar cambios no
reconocidos como trabajo del usuario.

### 2. Sincronizar sin sobrescribir

```bash
git fetch --prune origin
git rev-list --left-right --count develop...origin/develop
git rev-list --left-right --count release...origin/release
git rev-list --left-right --count master...origin/master
```

Para cada rama, si está solamente atrasada y limpia, usar `git merge --ff-only`.
Si está adelantada, confirmar que sus commits sean intencionales. Si diverge,
detenerse y reportar; nunca resolver automáticamente ni forzar.

### 3. Validar antes del commit

Ejecutar las pruebas, build, lint y validaciones documentadas por el proyecto,
además de `git diff --check`. Detenerse ante cualquier fallo.

### 4. Commit en develop

Configurar identidad local:

```bash
git config user.name rommel.gomez
git config user.email usi.rommel.gomez@slp.gob.mx
```

Cambiar a `develop`, actualizar con `--ff-only`, agregar únicamente las rutas
intencionadas y revisar el diff staged:

```bash
git switch develop
git add <rutas-explicitas>
git diff --cached --check
git diff --cached --stat
git commit -m "fix: <resumen>"
```

Usar un mensaje imperativo, claro y menor de 72 caracteres.

### 5. Publicar develop

```bash
git push origin develop
git ls-remote origin refs/heads/develop
```

### 6. Integrar y publicar release

```bash
git switch release
git merge --ff-only origin/release
git merge --no-ff develop -m "Integra develop en release: <resumen>"
```

Si hay conflicto, detenerse. Validar nuevamente y ejecutar `git push origin release`.

### 7. Integrar y publicar master

```bash
git switch master
git merge --ff-only origin/master
git merge --no-ff release -m "Integra release en master: <resumen>"
```

Si hay conflicto, detenerse. Validar nuevamente y ejecutar `git push origin master`.

### 8. Verificación final

```bash
git status --short --branch
git ls-remote --heads origin develop release master
git log -3 --format='%h %an <%ae> %s' master
```

Informar commits de cada rama, pruebas/build, estado limpio y si solo se activó
un pipeline o si el despliegue fue confirmado explícitamente.
