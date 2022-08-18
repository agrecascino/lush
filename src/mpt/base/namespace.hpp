/* SPDX-License-Identifier: BSL-1.0 OR BSD-3-Clause */

#ifndef MPT_BASE_NAMESPACE_HPP
#define MPT_BASE_NAMESPACE_HPP



#include "mpt/base/detect.hpp"
#include "mpt/base/version.hpp"
#include "mpt/base/compiletime_warning.hpp"



#if !defined(MPT_INLINE_NS)

#define MPT_BUILD_VERSION_NAMESPACE_IMPL(a, b, c, d) v##a##_##b##_##c##_##d
#define MPT_BUILD_VERSION_NAMESPACE(a, b, c, d)      MPT_BUILD_VERSION_NAMESPACE_IMPL(a, b, c, d)

#define MPT_VERSION_NAMESPACE MPT_BUILD_VERSION_NAMESPACE(MPT_VERSION_MAJOR, MPT_VERSION_MINOR, MPT_VERSION_PATCH, MPT_VERSION_BUILD)

#if MPT_OS_WINDOWS
#ifdef UNICODE
#define MPT_VERSION_ABI_OS u
#else
#define MPT_VERSION_ABI_OS 8
#endif
#else
#define MPT_VERSION_ABI_OS _
#endif

#if MPT_LIBC_GENERIC
#define MPT_VERSION_ABI_LIBC _
#elif MPT_LIBC_MS
#if MPT_LIBC_MS_SHARED
#ifdef MPT_LIBC_MS_DEBUG
#define MPT_VERSION_ABI_LIBC MDd
#else
#define MPT_VERSION_ABI_LIBC MDr
#endif
#elif MPT_LIBC_MS_STATIC
#ifdef MPT_LIBC_MS_DEBUG
#define MPT_VERSION_ABI_LIBC MTd
#else
#define MPT_VERSION_ABI_LIBC MTr
#endif
#else
#ifdef MPT_LIBC_MS_DEBUG
#define MPT_VERSION_ABI_LIBC Md
#else
#define MPT_VERSION_ABI_LIBC Mr
#endif
#endif
#elif MPT_LIBC_GLIBC
#define MPT_VERSION_ABI_LIBC G
#elif MPT_LIBC_MINGW
#define MPT_VERSION_ABI_LIBC MW
#elif MPT_LIBC_BIONIC
#define MPT_VERSION_ABI_LIBC B
#elif MPT_LIBC_APPLE
#define MPT_VERSION_ABI_LIBC A
#else
#define MPT_VERSION_ABI_LIBC _
#endif

#define MPT_BUILD_ABI_NAMESPACE_IMPL(a, b) ABI_##a##_##b
#define MPT_BUILD_ABI_NAMESPACE(a, b)      MPT_BUILD_ABI_NAMESPACE_IMPL(a, b)

#define MPT_ABI_NAMESPACE MPT_BUILD_ABI_NAMESPACE(MPT_VERSION_ABI_OS, MPT_VERSION_ABI_LIBC)

#if !defined(MPT_PROJECT_NAMESPACE)
MPT_WARNING("Please #define MPT_PROJECT_NAMESPACE or #define MPT_INLINE_NS in build configuration.")
#define MPT_PROJECT_NAMESPACE x
#endif // !MPT_PROJECT_NAMESPACE

#define MPT_BUILD_INLINE_NS_IMPL(a, b, c) a##_##b##_##c
#define MPT_BUILD_INLINE_NS(a, b, c)      MPT_BUILD_INLINE_NS_IMPL(a, b, c)

#define MPT_INLINE_NS MPT_BUILD_INLINE_NS(MPT_VERSION_NAMESPACE, MPT_ABI_NAMESPACE, MPT_PROJECT_NAMESPACE)

#endif // !MPT_INLINE_NS


namespace mpt {
inline namespace MPT_INLINE_NS {



} // namespace MPT_INLINE_NS
} // namespace mpt



#endif // MPT_BASE_NAMESPACE_HPP
