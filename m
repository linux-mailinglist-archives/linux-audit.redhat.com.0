Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ADC921079E8
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 22:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574457641;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F4btJziVYVyDqHJl1nYgdBOnV+Bz08KUVl540iVlYD8=;
	b=O7k9dyJ+aZpneZGLzuOY+u9SM3u1p5Id291YWFV/Pxs2sXX+R3Vo9JGdBhsoDfPXpE0OpP
	MXVLnbDTUklye389zuVj++Z9dnXJc81GcwWbE8StPaI4MyPN1cNLkk0GH0nvMvMlkokbDV
	ZqdYWg8Fcr3VwNgaboKunj/uFCtRwr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-_OlCtuSvMe6aRqRgJa2hBA-1; Fri, 22 Nov 2019 16:20:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6963477;
	Fri, 22 Nov 2019 21:20:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3573710013A7;
	Fri, 22 Nov 2019 21:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F5EA1809567;
	Fri, 22 Nov 2019 21:20:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMLKEtS030262 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 16:20:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F6E3101A397; Fri, 22 Nov 2019 21:20:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF48101A36B
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 21:20:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9F78E7698
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 21:20:12 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-165-4N8gCk9VMlGdhsgNYfoL5A-1; Fri, 22 Nov 2019 16:20:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id t5so8967887ljk.0
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 13:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dQSqJ6neRFmXDx8lm8Qp3vA/Za7E/c7vX34zGsQVNcI=;
	b=rf5nf2g6uq9FdC9bXUlB9DTCJragk0ZFQbOI4d6KFgg7eyNxRdiwWLMm6yD4AG6yPm
	mSzmubKPd4rLdMLK4h7U9HA1zzMpEdVDBF375OSQsX4gvL0t+g8BgdopaURaQN0NAWTe
	++oqm02yMBu3z/bGiEDJ1LgGbKF/UN8xQ/nEb6oYld62sEPl1r2xNgAg7HWkeM4U9BvH
	9QcCfHAtos8uz3g+VOuW3OneTiZ2ejMlEocxWNEODcN1gr0zr8RGkTyyngFejKpOfxS3
	IFL+bOF0ZhJ8uzUHd9DWGaCY6RzbZWMnK0C9dht8TfHO66vFt1xUKfUhzPPfYGikwRPB
	JGgg==
X-Gm-Message-State: APjAAAXWCrXIuCqSnRroraa1qUURbVun8xio87F5sfrGdCBeskAYb8Tg
	2qqHP3xQl54ztDW2G/qAkRkIBklghRdZLndF2Oc4
X-Google-Smtp-Source: APXvYqxYVbuLzbKwGGTALH/2DmA4GvH8Ct41sz4a8CcIQjCWRPZy1Z9qdLAKi6ck2lLud5M83S1DJltWAnNy0qcyvok=
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr13945218ljh.184.1574457606553; 
	Fri, 22 Nov 2019 13:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
	<CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
	<20191122192353.GA2157@krava>
In-Reply-To: <20191122192353.GA2157@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 22 Nov 2019 16:19:55 -0500
Message-ID: <CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@redhat.com>
X-MC-Unique: 4N8gCk9VMlGdhsgNYfoL5A-1
X-MC-Unique: _OlCtuSvMe6aRqRgJa2hBA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAMLKEtS030262
X-loop: linux-audit@redhat.com
Cc: Jiri Benc <jbenc@redhat.com>, Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
	Andrii Nakryiko <andriin@fb.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 22, 2019 at 2:24 PM Jiri Olsa <jolsa@redhat.com> wrote:
> Paul,
> would following output be ok:
>
>     type=SYSCALL msg=audit(1574445211.897:28015): arch=c000003e syscall=321 success=no exit=-13 a0=5 a1=7fff09ac6c60 a2=78 a3=6 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
>     type=PROCTITLE msg=audit(1574445211.897:28015): proctitle="./test_verifier"
>     type=BPF msg=audit(1574445211.897:28016): prog-id=8103 event=LOAD
>
>     type=SYSCALL msg=audit(1574445211.897:28016): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7fff09ac6b80 a2=78 a3=0 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
>     type=PROCTITLE msg=audit(1574445211.897:28016): proctitle="./test_verifier"
>     type=BPF msg=audit(1574445211.897:28017): prog-id=8103 event=UNLOAD

There is some precedence in using "op=" instead of "event=" (an audit
"event" is already a thing, using "event=" here might get confusing).
I suppose if we are getting really nit-picky you might want to
lower-case the LOAD/UNLOAD, but generally Steve cares more about these
things than I do.

For reference, we have a searchable database of fields here:
* https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/field-dictionary.csv

> I assume for audit-userspace and audit-testsuite the change will
> go in as github PR, right? I have the auditd change ready and will
> add test shortly.

You can submit the audit-testsuite either as a GH PR or as a
patch(set) to the linux-audit mailing list, both work equally well.  I
believe has the same policy for his userspace tools, but I'll let him
speak for himself.

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 18925d924c73..c69d2776d197 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -358,8 +358,6 @@ static inline void audit_ptrace(struct task_struct *t)
>                 __audit_ptrace(t);
>  }
>
> -extern void audit_log_task(struct audit_buffer *ab);
> -
>                                 /* Private API (for audit.c only) */
>  extern void __audit_ipc_obj(struct kern_ipc_perm *ipcp);
>  extern void __audit_ipc_set_perm(unsigned long qbytes, uid_t uid, gid_t gid, umode_t mode);
> @@ -648,8 +646,6 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
>  static inline void audit_ptrace(struct task_struct *t)
>  { }
>
> -static inline void audit_log_task(struct audit_buffer *ab)
> -{ }
>  #define audit_n_rules 0
>  #define audit_signals 0
>  #endif /* CONFIG_AUDITSYSCALL */
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 9bf1045fedfa..4effe01ebbe2 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2545,7 +2545,7 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
>         audit_log_ntp_val(ad, "adjust", AUDIT_NTP_ADJUST);
>  }
>
> -void audit_log_task(struct audit_buffer *ab)
> +static void audit_log_task(struct audit_buffer *ab)

I'm slightly concerned that this is based on top of your other patch
which was NACK'ed.  I might not have been clear before, but with the
merge window set to open in a few days, and this change affecting the
kernel interface (uapi, etc.) and lacking a test, this isn't something
that I see as a candidate for the upcoming merge window.  *Please*
revert your original patch first; if you think I'm cranky now I can
promise I'll be a lot more cranky if I see the original patch in -rc1
;)

> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index b51ecb9644d0..e3a7fa4d7a82 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1334,7 +1334,6 @@ static const char * const bpf_event_audit_str[] = {
>
>  static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_event event)
>  {
> -       bool has_task_context = event == BPF_EVENT_LOAD;
>         struct audit_buffer *ab;
>
>         if (audit_enabled == AUDIT_OFF)
> @@ -1342,10 +1341,7 @@ static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_event event)
>         ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
>         if (unlikely(!ab))
>                 return;
> -       if (has_task_context)
> -               audit_log_task(ab);
> -       audit_log_format(ab, "%sprog-id=%u event=%s",
> -                        has_task_context ? " " : "",
> +       audit_log_format(ab, "prog-id=%u event=%s",
>                          prog->aux->id, bpf_event_audit_str[event]);

Other than the "op" instead of "event", this looks reasonable to me.
I would give Steve a chance to comment on it from the userspace side
of things.

>         audit_log_end(ab);
>  }

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

