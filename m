Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 993DD112D92
	for <lists+linux-audit@lfdr.de>; Wed,  4 Dec 2019 15:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575470325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s/pfGWG/dxccUL9sU6/0ujZlpfoV5V+/bLIS81XfLVQ=;
	b=MDs3Q+uOnpzLQjh9WpzSqlTO/cBtiRmrdNkSiVISuk1YTNnGFVOvpf/FCYERwIUZETVfZR
	FSOwWF6xg1CumpMzUDAsCgRGBk1sLy33XtsFcY0puh6ZTAqN6SW8riAo2UpCKI8KZxDVyF
	BI+pFcaij+rkaSsZVIcm+xTJQwDK1EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-aJ_dd30WPKGCy6mL8ZbtNw-1; Wed, 04 Dec 2019 09:38:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4303618B9FC2;
	Wed,  4 Dec 2019 14:38:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C97C19C68;
	Wed,  4 Dec 2019 14:38:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFDAC18033C0;
	Wed,  4 Dec 2019 14:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4EcROR009994 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:38:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3468208BDC0; Wed,  4 Dec 2019 14:38:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E5962026D67
	for <linux-audit@redhat.com>; Wed,  4 Dec 2019 14:38:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 820CE8001FC
	for <linux-audit@redhat.com>; Wed,  4 Dec 2019 14:38:25 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-L_7KW5RYNdi0wQdjvJ190w-1; Wed, 04 Dec 2019 09:38:23 -0500
Received: by mail-lf1-f67.google.com with SMTP id q6so6314032lfb.6
	for <linux-audit@redhat.com>; Wed, 04 Dec 2019 06:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PaJ3UPjj7Nz7m7Ne5I2c6eF0XwrYN5YcMxlYR5F12d0=;
	b=sVdeliFfYquEu6ihDzr62lVRMzj3R0iFsqXW0F3s/2TVB1WMCQ7OjGJ32miZngp9tk
	TqeQoeZMdemP/+/f+wdKupAm7yzRZtppmnOGHyf0FobuVCdAphnsdZicwK9fDGDd+s5o
	xfPJqsXLOybp+aBgdiuZmQaCMoyiSeyv//9BjG0rmesXeHMTXCA2POW5JsDLPJysiuj5
	gCxMCoHl18LPBMghrZ0H1Od3fzYXpUo15XfZGZgbdJlnUFr0wEoNgc2Mve2ms1d17++F
	PC4SzRe/k+xhCKxLasBV5mFIU0I2yqbVdaRa8TLdC+8HwMngvxhAwRAUY+tuEsZOA2hw
	tMwA==
X-Gm-Message-State: APjAAAUtgXi83EpWUB5TdasUyr95Dtm4Su5wB0wXmTRgWr5Jo79MBkJp
	QqtqVx6qk+E0ic9NYCUvyhD0uWQxeHoxooarK7vr
X-Google-Smtp-Source: APXvYqw1BPiBASWC3NkdSGy61VyInQU9ytLgtR07luIoLsu3uzuX/jup0unpcNDRA+o4gAWrHaP+XNIyt6Ph544HwD0=
X-Received: by 2002:ac2:424d:: with SMTP id m13mr2261508lfl.13.1575470301379; 
	Wed, 04 Dec 2019 06:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
	<20191203093837.GC17468@krava>
	<CAHC9VhRhMhsRPj1D2TY3O=Nc6Rx9=o1-Z5ZMjrCepfFY6VtdbQ@mail.gmail.com>
	<20191204140827.GB12431@krava>
In-Reply-To: <20191204140827.GB12431@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 Dec 2019 09:38:10 -0500
Message-ID: <CAHC9VhTrUQYp8Ubhu_B_fv-HSdwmgYRy+r1p9uKz7WcRfDQBKA@mail.gmail.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@redhat.com>
X-MC-Unique: L_7KW5RYNdi0wQdjvJ190w-1
X-MC-Unique: aJ_dd30WPKGCy6mL8ZbtNw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4EcROR009994
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 4, 2019 at 9:08 AM Jiri Olsa <jolsa@redhat.com> wrote:
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index c89c6495983d..32a5db900f47 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -116,6 +116,7 @@
>  #define AUDIT_FANOTIFY         1331    /* Fanotify access decision */
>  #define AUDIT_TIME_INJOFFSET   1332    /* Timekeeping offset injected */
>  #define AUDIT_TIME_ADJNTPVAL   1333    /* NTP value adjustment */
> +#define AUDIT_BPF              1334    /* BPF subsystem */
>
>  #define AUDIT_AVC              1400    /* SE Linux avc denial or grant */
>  #define AUDIT_SELINUX_ERR      1401    /* Internal SE Linux Errors */
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index e3461ec59570..81f1a6308aa8 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -23,6 +23,7 @@
>  #include <linux/timekeeping.h>
>  #include <linux/ctype.h>
>  #include <linux/nospec.h>
> +#include <linux/audit.h>
>  #include <uapi/linux/btf.h>
>
>  #define IS_FD_ARRAY(map) ((map)->map_type == BPF_MAP_TYPE_PERF_EVENT_ARRAY || \
> @@ -1306,6 +1307,33 @@ static int find_prog_type(enum bpf_prog_type type, struct bpf_prog *prog)
>         return 0;
>  }
>
> +enum bpf_audit {
> +       BPF_AUDIT_LOAD,
> +       BPF_AUDIT_UNLOAD,
> +};
> +
> +static const char * const bpf_audit_str[] = {
> +       [BPF_AUDIT_LOAD]   = "LOAD",
> +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> +};
> +
> +static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> +{
> +       struct audit_context *ctx = NULL;
> +       struct audit_buffer *ab;
> +
> +       if (audit_enabled == AUDIT_OFF)
> +               return;
> +       if (op == BPF_AUDIT_LOAD)
> +               ctx = audit_context();
> +       ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
> +       if (unlikely(!ab))
> +               return;
> +       audit_log_format(ab, "prog-id=%u op=%s",
> +                        prog->aux->id, bpf_audit_str[op]);
> +       audit_log_end(ab);
> +}

As mentioned previously, I still think it might be a good idea to
ensure "op" is within the bounds of bpf_audit_str, but the audit bits
look reasonable to me.

>  int __bpf_prog_charge(struct user_struct *user, u32 pages)
>  {
>         unsigned long memlock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> @@ -1421,6 +1449,7 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
>  {
>         if (atomic64_dec_and_test(&prog->aux->refcnt)) {
>                 perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
> +               bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
>                 /* bpf_prog_free_id() must be called first */
>                 bpf_prog_free_id(prog, do_idr_lock);
>                 __bpf_prog_put_noref(prog, true);
> @@ -1830,6 +1859,7 @@ static int bpf_prog_load(union bpf_attr *attr, union bpf_attr __user *uattr)
>          */
>         bpf_prog_kallsyms_add(prog);
>         perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
> +       bpf_audit_prog(prog, BPF_AUDIT_LOAD);
>
>         err = bpf_prog_new_fd(prog);
>         if (err < 0)
> --
> 2.23.0

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

