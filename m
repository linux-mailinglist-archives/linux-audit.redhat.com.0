Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D9D68E548E
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 21:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572032668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rvQvCzXqmCVQuC2WTTK9c4NRCy8pR7qef/TGumQTfuo=;
	b=FgGL3rRJxCkWDjZUuS1SHlVTH2U390Hz8/HC6LVG5dIdQH7ilorCpq+PVqwd4lYV6rUGPs
	BH7s4D7/JCEjRV7Y3gjCZjQqcSGTiDLqd6pkQS77tmq1zn14hNoNaXx39VcizJOyLFj0qi
	8x/q5suvaLWdZu7R+mS1M7CF4OQPee8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-WHIGVMJrNA6d29uiULIFkg-1; Fri, 25 Oct 2019 15:44:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA7AC5F0;
	Fri, 25 Oct 2019 19:44:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B6865C1B5;
	Fri, 25 Oct 2019 19:44:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 492B54E58A;
	Fri, 25 Oct 2019 19:44:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PJiD6d024242 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 15:44:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9831001DC2; Fri, 25 Oct 2019 19:44:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AED061001B23;
	Fri, 25 Oct 2019 19:43:59 +0000 (UTC)
Date: Fri, 25 Oct 2019 15:43:56 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 05/21] audit: log drop of contid on exit of
	last task
Message-ID: <20191025194356.skqebldthpokwd2m@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<71b75f54342f32f176c2b6d94584f2a666964e68.1568834524.git.rgb@redhat.com>
	<CAHC9VhQYVzGKRx48dgX1j3CJOe1N0widkhWb=_-3ohnOdZHhUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQYVzGKRx48dgX1j3CJOe1N0widkhWb=_-3ohnOdZHhUw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: WHIGVMJrNA6d29uiULIFkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-10 20:38, Paul Moore wrote:
> On Wed, Sep 18, 2019 at 9:24 PM Richard Guy Briggs <rgb@redhat.com> wrote=
:
> > Since we are tracking the life of each audit container indentifier, we
> > can match the creation event with the destruction event.  Log the
> > destruction of the audit container identifier when the last process in
> > that container exits.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  kernel/audit.c   | 32 ++++++++++++++++++++++++++++++++
> >  kernel/audit.h   |  2 ++
> >  kernel/auditsc.c |  2 ++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index ea0899130cc1..53d13d638c63 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2503,6 +2503,38 @@ int audit_set_contid(struct task_struct *task, u=
64 contid)
> >         return rc;
> >  }
> >
> > +void audit_log_container_drop(void)
> > +{
> > +       struct audit_buffer *ab;
> > +       uid_t uid;
> > +       struct tty_struct *tty;
> > +       char comm[sizeof(current->comm)];
> > +
> > +       if (!current->audit || !current->audit->cont ||
> > +           refcount_read(&current->audit->cont->refcount) > 1)
> > +               return;
> > +       ab =3D audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTA=
INER_OP);
> > +       if (!ab)
> > +               return;
> > +
> > +       uid =3D from_kuid(&init_user_ns, task_uid(current));
> > +       tty =3D audit_get_tty();
> > +       audit_log_format(ab,
> > +                        "op=3Ddrop opid=3D%d contid=3D%llu old-contid=
=3D%llu pid=3D%d uid=3D%u auid=3D%u tty=3D%s ses=3D%u",
> > +                        task_tgid_nr(current), audit_get_contid(curren=
t),
> > +                        audit_get_contid(current), task_tgid_nr(curren=
t), uid,
> > +                        from_kuid(&init_user_ns, audit_get_loginuid(cu=
rrent)),
> > +                        tty ? tty_name(tty) : "(none)",
> > +                                audit_get_sessionid(current));
> > +       audit_put_tty(tty);
> > +       audit_log_task_context(ab);
> > +       audit_log_format(ab, " comm=3D");
> > +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> > +       audit_log_d_path_exe(ab, current->mm);
> > +       audit_log_format(ab, " res=3D1");
> > +       audit_log_end(ab);
> > +}
>=20
> Why can't we just do this in audit_cont_put()?  Is it because we call
> audit_cont_put() in the new audit_free() function?  What if we were to
> do it in __audit_free()/audit_free_syscall()?

The intent was to put this before the EOE record of a syscall so we
could fill out all the fields similarly to op=3Dset, but this could stand
alone dropping or nulling a bunch of fields.

It would also never get printed if we left it before the EOE and had the
audit signal info record keep a reference to it.

Hmmm...

> paul moore

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

