FROM dart:stable AS build

WORKDIR /app

# Install Dart Frog CLI
RUN dart pub global activate dart_frog_cli

# Make globally activated Dart executables available
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

COPY --from=build /app/build /app/build

EXPOSE 8080

CMD ["dart", "run", "build/bin/server.dart", "--host", "0.0.0.0", "--port", "8080"]