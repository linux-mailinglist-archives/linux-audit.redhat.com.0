Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B30331522A7
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 00:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580857387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qc0T2OaBAoX5OGWGSmpE/OC5MWEyya6vbYy9ZXnuhYs=;
	b=Mc6VcGCQA4QHEHNZfa30H7ZUPfhsaXw8a606LMASZm9n1vFMDhzCYc16s+8DGI2MKxw9xY
	3KK/XINY4glkyjZc9i8NhOtqu0/0YzbkCZ4MIajNxsHbr1eZLiVSp5pREwSi04TUcqEyyo
	FOO+RKGRSRbpiuEZZKyCuiOQX2atATU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-NaINWkn9MY2Zlpzacds3AA-1; Tue, 04 Feb 2020 18:03:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04867108442C;
	Tue,  4 Feb 2020 23:03:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D9118477C;
	Tue,  4 Feb 2020 23:02:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DA6A8174C;
	Tue,  4 Feb 2020 23:02:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014N2p47014808 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 18:02:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BFBF78477C; Tue,  4 Feb 2020 23:02:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D4877927;
	Tue,  4 Feb 2020 23:02:37 +0000 (UTC)
Date: Tue, 4 Feb 2020 18:02:35 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 05/16] audit: log drop of contid on exit of
	last task
Message-ID: <20200204230235.dwunh76dum4kkssp@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<b3725abab452beaba740ac58f76144e6c3bda2fa.1577736799.git.rgb@redhat.com>
	<CAHC9VhQ=+4P6Rr1S1-sNb2X-CbYYKMQMJDGP=bBr8GG3xLD8qQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ=+4P6Rr1S1-sNb2X-CbYYKMQMJDGP=bBr8GG3xLD8qQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: NaINWkn9MY2Zlpzacds3AA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 16:28, Paul Moore wrote:
> On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Since we are tracking the life of each audit container indentifier, we
> > can match the creation event with the destruction event.  Log the
> > destruction of the audit container identifier when the last process in
> > that container exits.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  kernel/audit.c   | 17 +++++++++++++++++
> >  kernel/audit.h   |  2 ++
> >  kernel/auditsc.c |  2 ++
> >  3 files changed, 21 insertions(+)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 4bab20f5f781..fa8f1aa3a605 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2502,6 +2502,23 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> >         return rc;
> >  }
> >
> > +void audit_log_container_drop(void)
> > +{
> > +       struct audit_buffer *ab;
> > +
> > +       if (!current->audit || !current->audit->cont ||
> > +           refcount_read(&current->audit->cont->refcount) > 1)
> > +               return;
> > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> > +       if (!ab)
> > +               return;
> > +
> > +       audit_log_format(ab, "op=drop opid=%d contid=%llu old-contid=%llu",
> > +                        task_tgid_nr(current), audit_get_contid(current),
> > +                        audit_get_contid(current));
> > +       audit_log_end(ab);
> > +}
> 
> Assumine we are careful about where we call it in audit_free(...), you
> are confident we can't do this as part of _audit_contobj_put(...),
> yes?

We need audit_log_container_drop in audit_free_syscall() due to needing
context, which gets freed in audit_free_syscall() called from
audit_free().

We need audit_log_container_drop in audit_log_exit() due to having that
record included before the EOE record at the end of audit_log_exit().

We could put in _contobj_put() if we drop context and any attempt to
connect it with a syscall record, which I strongly discourage.

The syscall record contains info about subject, container_id record only
contains info about container object other than subj pid.

> >  /**
> >   * audit_log_end - end one audit record
> >   * @ab: the audit_buffer
> > diff --git a/kernel/audit.h b/kernel/audit.h
> > index e4a31aa92dfe..162de8366b32 100644
> > --- a/kernel/audit.h
> > +++ b/kernel/audit.h
> > @@ -255,6 +255,8 @@ extern void audit_log_d_path_exe(struct audit_buffer *ab,
> >  extern struct tty_struct *audit_get_tty(void);
> >  extern void audit_put_tty(struct tty_struct *tty);
> >
> > +extern void audit_log_container_drop(void);
> > +
> >  /* audit watch/mark/tree functions */
> >  #ifdef CONFIG_AUDITSYSCALL
> >  extern unsigned int audit_serial(void);
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 0e2d50533959..bd855794ad26 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -1568,6 +1568,8 @@ static void audit_log_exit(void)
> >
> >         audit_log_proctitle();
> >
> > +       audit_log_container_drop();
> > +
> >         /* Send end of event record to help user space know we are finished */
> >         ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
> >         if (ab)
> > --
> > 1.8.3.1
> >
> 
> --
> paul moore
> www.paul-moore.com
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

