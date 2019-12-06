Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 052AC115871
	for <lists+linux-audit@lfdr.de>; Fri,  6 Dec 2019 22:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575666724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z0/YPHo8Dg+wX3UeRX+L7lm4ebYEwYBVHYj90QbJWaQ=;
	b=HAkQwL9esMZ6Iu+KAiBaSOUpFMlTthZ6NFIsHvnAsr69UcH+8aQTyijyuP0X8a3LaTXvJc
	29BPyq3MBgOG9X5qXXcQedqewSULUD5r5KPLpXGKJ+SUOyNO9wa04elKo0qYozRULtqFDM
	r8SOqfKhAgtx8sdmTivALsv4lMZRxw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-B4O3jqoYP1-c6PxPmBcwWw-1; Fri, 06 Dec 2019 16:12:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F2F107B768;
	Fri,  6 Dec 2019 21:11:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78B2B6E3E1;
	Fri,  6 Dec 2019 21:11:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 727CD18089CD;
	Fri,  6 Dec 2019 21:11:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6LBVCK013209 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 16:11:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 25CB920316DF; Fri,  6 Dec 2019 21:11:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA5A20316E0
	for <linux-audit@redhat.com>; Fri,  6 Dec 2019 21:11:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9628803B57
	for <linux-audit@redhat.com>; Fri,  6 Dec 2019 21:11:28 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-172-9TRcw5KzOW2PPSXTzMQxdg-1; Fri, 06 Dec 2019 16:11:27 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so9148407ljg.3
	for <linux-audit@redhat.com>; Fri, 06 Dec 2019 13:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DcswDcKmSJyRQPJcgySZXuflqUPk7eZxT2PzLNE9GK4=;
	b=VxEGQ9zmWzcgd0ErgVziF1aXm9K4yGfWodvvuMSuUDVWSGK8aRZjGnepFNZIu+Fjnz
	4aWlYqyPTQuVK4n9UvCtcFMFssigsuQyvcRJ6Akx17T1rI79wexYqcFysl1SJnAJK2GC
	Sx+10SnE6/V86NVrVkihs3ndV0k0Ec8znrBQ3EfbiW4gvGUmN3e6rKSgsSP8Sogsv6l9
	ytyTfFU0k2o3VWL8DVoD6z9xvXH/kQTNjY23rF78xRktpEMNJKj/wa79yZImp6QZW4vE
	usc2ZB5to7zQosflDIHOYlgJaAMoMNmy43gIKccK/7MP1e3+UeL/VbLyFtX8i8vfyya3
	SiVg==
X-Gm-Message-State: APjAAAXYylIuDBgokllqIHul+ywt3crRc2RlgkbbyPA/QzgOM6PsCawQ
	Z7vWacxcXpJkbaHNV3oXajtWZbLsdOR6EpLIzLuo
X-Google-Smtp-Source: APXvYqzILr1spmyw4/Oebtijvj5znSLSPO2cXZu0/HOjsfYWmq8Uhm0oa2QneWLTlf5JKMACZvEWWvbzE0Ys5lczSiQ=
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr9726075ljj.243.1575666684955; 
	Fri, 06 Dec 2019 13:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20191205102552.19407-1-jolsa@kernel.org>
In-Reply-To: <20191205102552.19407-1-jolsa@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Dec 2019 16:11:13 -0500
Message-ID: <CAHC9VhTWnNvfMAPz-WhD9Wqv6UZZDBdMxF9VuS3UeTLHLtfhHw@mail.gmail.com>
Subject: Re: [PATCHv2] bpf: Emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@kernel.org>
X-MC-Unique: 9TRcw5KzOW2PPSXTzMQxdg-1
X-MC-Unique: B4O3jqoYP1-c6PxPmBcwWw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB6LBVCK013209
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	David Miller <davem@redhat.com>, Yonghong Song <yhs@fb.com>,
	bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
	Martin KaFai Lau <kafai@fb.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 5, 2019 at 5:26 AM Jiri Olsa <jolsa@kernel.org> wrote:
> From: Daniel Borkmann <daniel@iogearbox.net>
>
> Allow for audit messages to be emitted upon BPF program load and
> unload for having a timeline of events. The load itself is in
> syscall context, so additional info about the process initiating
> the BPF prog creation can be logged and later directly correlated
> to the unload event.
>
> The only info really needed from BPF side is the globally unique
> prog ID where then audit user space tooling can query / dump all
> info needed about the specific BPF program right upon load event
> and enrich the record, thus these changes needed here can be kept
> small and non-intrusive to the core.
>
> Raw example output:
>
>   # auditctl -D
>   # auditctl -a always,exit -F arch=x86_64 -S bpf
>   # ausearch --start recent -m 1334
>   ...
>   ----
>   time->Wed Nov 27 16:04:13 2019
>   type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
>   type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
>     success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
>     pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
>     egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
>     exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
>     subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
>   type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
>   ----
>   time->Wed Nov 27 16:04:13 2019
>   type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
>   ...
>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  include/uapi/linux/audit.h |  1 +
>  kernel/bpf/syscall.c       | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> v2 changes:
>   addressed Paul's comments from audit side:
>     - change 'event' field to 'op'
>     - change audit context passing
>     - check on 'op' value is within the limit
>
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
> index e3461ec59570..6536665f562c 100644
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
> @@ -1306,6 +1307,36 @@ static int find_prog_type(enum bpf_prog_type type, struct bpf_prog *prog)
>         return 0;
>  }
>
> +enum bpf_audit {
> +       BPF_AUDIT_LOAD,
> +       BPF_AUDIT_UNLOAD,
> +       BPF_AUDIT_MAX,
> +};
> +
> +static const char * const bpf_audit_str[BPF_AUDIT_MAX] = {
> +       [BPF_AUDIT_LOAD]   = "LOAD",
> +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> +};
> +
> +static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
> +{
> +       struct audit_context *ctx = NULL;
> +       struct audit_buffer *ab;
> +
> +       if (audit_enabled == AUDIT_OFF)
> +               return;
> +       if (WARN_ON_ONCE(op >= BPF_AUDIT_MAX))
> +               return;

I feel bad saying this given the number of revisions we are at with
this patch, but since we aren't even at -rc1 yet (although it will be
here soon), I'm going to mention it anyway ;)

... if we move the "op >= BPF_AUDIT_MAX" above the audit_enabled check
we will catch problems sooner in development, which is a very good
thing as far as I'm concerned.

Other than that, this looks good to me, and I see Steve has already
given the userspace portion a thumbs-up.  Have you started on the
audit-testsuite test for this yet?

> +       if (op == BPF_AUDIT_LOAD)
> +               ctx = audit_context();
> +       ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
> +       if (unlikely(!ab))
> +               return;
> +       audit_log_format(ab, "prog-id=%u op=%s",
> +                        prog->aux->id, bpf_audit_str[op]);
> +       audit_log_end(ab);
> +}
> +
>  int __bpf_prog_charge(struct user_struct *user, u32 pages)
>  {
>         unsigned long memlock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> @@ -1421,6 +1452,7 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
>  {
>         if (atomic64_dec_and_test(&prog->aux->refcnt)) {
>                 perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
> +               bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
>                 /* bpf_prog_free_id() must be called first */
>                 bpf_prog_free_id(prog, do_idr_lock);
>                 __bpf_prog_put_noref(prog, true);
> @@ -1830,6 +1862,7 @@ static int bpf_prog_load(union bpf_attr *attr, union bpf_attr __user *uattr)
>          */
>         bpf_prog_kallsyms_add(prog);
>         perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
> +       bpf_audit_prog(prog, BPF_AUDIT_LOAD);
>
>         err = bpf_prog_new_fd(prog);
>         if (err < 0)
> --
> 2.21.0

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

