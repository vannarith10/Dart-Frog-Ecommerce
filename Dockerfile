# =========================
# Build
# =========================
FROM dart:stable AS build

WORKDIR /app

RUN dart pub global activate dart_frog_cli

ENV PATH="$PATH:/root/.pub-cache/bin"

COPY pubspec.* ./

RUN dart pub get

COPY . .

RUN dart pub get

RUN dart_frog build

# =========================
# Runtime
# =========================
FROM dart:stable

WORKDIR /app

COPY --from=build /app/build .

RUN dart pub get

EXPOSE 8080

CMD ["dart", "run", "bin/server.dart", "--host", "0.0.0.0", "--port", "8080"]