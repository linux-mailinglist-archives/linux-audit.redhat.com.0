Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9A31B108EE2
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 14:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574688637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7E4TN/TWE/FeGiUSkLAR6YvRy4USJpACmBQYPeTeVvE=;
	b=NmEKitldyqTVfmuKTVzzavn+0j8PuoYu93JHOtZGcboFE88i2msNA4x4A1KK4WY/SVNZCR
	YtUV/UNKGvR+g4gWgRgze7pUNT6d9L0UFKMVQlH54v7aOha4JYtWpIF97MmRrm6YgzswUB
	AGRTj0ZpYMjaBwy1akGjElzvvu6UMO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-jgCZTbckMLWAHSKHC4LoTw-1; Mon, 25 Nov 2019 08:30:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189D9800593;
	Mon, 25 Nov 2019 13:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B13E466087;
	Mon, 25 Nov 2019 13:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22A364BB78;
	Mon, 25 Nov 2019 13:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAN8vQ18011861 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 23 Nov 2019 03:57:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E60885D6A3; Sat, 23 Nov 2019 08:57:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with SMTP id 5AA9D5D6A0;
	Sat, 23 Nov 2019 08:57:19 +0000 (UTC)
Date: Sat, 23 Nov 2019 09:57:19 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191123085719.GA1673@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
	<CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
	<20191122192353.GA2157@krava>
	<CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:30:17 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: jgCZTbckMLWAHSKHC4LoTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Nov 22, 2019 at 04:19:55PM -0500, Paul Moore wrote:
> On Fri, Nov 22, 2019 at 2:24 PM Jiri Olsa <jolsa@redhat.com> wrote:
> > Paul,
> > would following output be ok:
> >
> >     type=SYSCALL msg=audit(1574445211.897:28015): arch=c000003e syscall=321 success=no exit=-13 a0=5 a1=7fff09ac6c60 a2=78 a3=6 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
> >     type=PROCTITLE msg=audit(1574445211.897:28015): proctitle="./test_verifier"
> >     type=BPF msg=audit(1574445211.897:28016): prog-id=8103 event=LOAD
> >
> >     type=SYSCALL msg=audit(1574445211.897:28016): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7fff09ac6b80 a2=78 a3=0 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
> >     type=PROCTITLE msg=audit(1574445211.897:28016): proctitle="./test_verifier"
> >     type=BPF msg=audit(1574445211.897:28017): prog-id=8103 event=UNLOAD
> 
> There is some precedence in using "op=" instead of "event=" (an audit
> "event" is already a thing, using "event=" here might get confusing).
> I suppose if we are getting really nit-picky you might want to
> lower-case the LOAD/UNLOAD, but generally Steve cares more about these
> things than I do.
> 
> For reference, we have a searchable database of fields here:
> * https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/field-dictionary.csv

I'm fine with "op", Daniel, Alexei?

> 
> > I assume for audit-userspace and audit-testsuite the change will
> > go in as github PR, right? I have the auditd change ready and will
> > add test shortly.
> 
> You can submit the audit-testsuite either as a GH PR or as a
> patch(set) to the linux-audit mailing list, both work equally well.  I
> believe has the same policy for his userspace tools, but I'll let him
> speak for himself.

ok

> 
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 18925d924c73..c69d2776d197 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -358,8 +358,6 @@ static inline void audit_ptrace(struct task_struct *t)
> >                 __audit_ptrace(t);
> >  }
> >
> > -extern void audit_log_task(struct audit_buffer *ab);
> > -
> >                                 /* Private API (for audit.c only) */
> >  extern void __audit_ipc_obj(struct kern_ipc_perm *ipcp);
> >  extern void __audit_ipc_set_perm(unsigned long qbytes, uid_t uid, gid_t gid, umode_t mode);
> > @@ -648,8 +646,6 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
> >  static inline void audit_ptrace(struct task_struct *t)
> >  { }
> >
> > -static inline void audit_log_task(struct audit_buffer *ab)
> > -{ }
> >  #define audit_n_rules 0
> >  #define audit_signals 0
> >  #endif /* CONFIG_AUDITSYSCALL */
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 9bf1045fedfa..4effe01ebbe2 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -2545,7 +2545,7 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
> >         audit_log_ntp_val(ad, "adjust", AUDIT_NTP_ADJUST);
> >  }
> >
> > -void audit_log_task(struct audit_buffer *ab)
> > +static void audit_log_task(struct audit_buffer *ab)
> 
> I'm slightly concerned that this is based on top of your other patch
> which was NACK'ed.  I might not have been clear before, but with the
> merge window set to open in a few days, and this change affecting the
> kernel interface (uapi, etc.) and lacking a test, this isn't something
> that I see as a candidate for the upcoming merge window.  *Please*
> revert your original patch first; if you think I'm cranky now I can
> promise I'll be a lot more cranky if I see the original patch in -rc1
> ;)

no worries, I'm used to cranky ;-)
Alexei already asked Dave to revert this in previous email,
so that should happen

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

