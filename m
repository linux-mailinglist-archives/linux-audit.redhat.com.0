Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 745201BE694
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 20:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588186105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/NBW2qDaMM5sdn+azgggfYxhduPEfEYDG18QhODKC94=;
	b=hqEN9BL56OXz4+PRaRe48EsRDBLZQKyzzOYT9GtPGlB+9wK3NqHybBTQlhiq1GgQvdUWqs
	t6Iskj5pn+F3nzLUV1c7tnfMNCqhB94ouiRImq1x83dYO6STqwTm/muLSbAHjJif+W+Hie
	HtOHTOfpuyRwQauNTgMFROqq/M3Ciu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-5qE5RKvNNTaV7zPa26bSWQ-1; Wed, 29 Apr 2020 14:48:22 -0400
X-MC-Unique: 5qE5RKvNNTaV7zPa26bSWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78D21108597C;
	Wed, 29 Apr 2020 18:48:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 491C179B6;
	Wed, 29 Apr 2020 18:48:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 628941809542;
	Wed, 29 Apr 2020 18:48:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TIluQh001242 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 14:47:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51FA45C1BE; Wed, 29 Apr 2020 18:47:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-53.phx2.redhat.com [10.3.114.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 415D54D6F1;
	Wed, 29 Apr 2020 18:47:49 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Date: Wed, 29 Apr 2020 14:47:48 -0400
Message-ID: <3348737.k9gCtgYObn@x2>
Organization: Red Hat
In-Reply-To: <20200429143146.3vlcmwvljo74ydb4@madcap2.tricolour.ca>
References: <cover.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200429143146.3vlcmwvljo74ydb4@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, April 29, 2020 10:31:46 AM EDT Richard Guy Briggs wrote:
> On 2020-04-28 18:25, Paul Moore wrote:
> > On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> 
wrote:
> > > Some table unregister actions seem to be initiated by the kernel to
> > > garbage collect unused tables that are not initiated by any userspace
> > > actions.  It was found to be necessary to add the subject credentials
> > > to  cover this case to reveal the source of these actions.  A sample
> > > record:
> > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat
> > >   family=bridge entries=0 op=unregister pid=153 uid=root auid=unset
> > >   tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0
> > >   comm=kworker/u4:2 exe=(null)> 
> > [I'm going to comment up here instead of in the code because it is a
> > bit easier for everyone to see what the actual impact might be on the
> > records.]
> > 
> > Steve wants subject info in this case, okay, but let's try to trim out
> > some of the fields which simply don't make sense in this record; I'm
> > thinking of fields that are unset/empty in the kernel case and are
> > duplicates of other records in the userspace/syscall case.  I think
> > that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> 
> From the ghak28 discussion, this list and order was selected due to
> Steve's preference for the "kernel" record convention, so deviating from
> this will create yet a new field list.  I'll defer to Steve on this.  It
> also has to do with the searchability of fields if they are missing.
> 
> I do agree that some fields will be superfluous in the kernel case.
> The most important field would be "subj", but then "pid" and "comm", I
> would think.  Based on this contents of the "subj" field, I'd think that
> "uid", "auid", "tty", "ses" and "exe" are not needed.

We can't be adding deleting fields based on how its triggered. If they are 
unset, that is fine. The main issue is they have to behave the same.

> > While "auid" is a potential target for removal based on the
> > dup-or-unset criteria, I think it falls under Steve's request for
> > subject info here, even if it is garbage in this case.

auid is always unset for daemons. We do not throw it away because of that.

-Steve

> If we keep auid, I'd say keep ses, since they usually go together,
> though they are separated by another field in this "kernel" record field
> ordering.
> 
> I expect this orphan record to occur so infrequently that I don't think
> bandwidth or space are a serious concern.
> 
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > 
> > >  kernel/auditsc.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index d281c18d1771..d7a45b181be0 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -2557,12 +2557,30 @@ void __audit_log_nfcfg(const char *name, u8 af,
> > > unsigned int nentries,> > 
> > >                        enum audit_nfcfgop op)
> > >  
> > >  {
> > >  
> > >         struct audit_buffer *ab;
> > > 
> > > +       const struct cred *cred;
> > > +       struct tty_struct *tty;
> > > +       char comm[sizeof(current->comm)];
> > > 
> > >         ab = audit_log_start(audit_context(), GFP_KERNEL,
> > >         AUDIT_NETFILTER_CFG);
> > >         if (!ab)
> > >         
> > >                 return;
> > >         
> > >         audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
> > >         
> > >                          name, af, nentries, audit_nfcfgs[op].s);
> > > 
> > > +
> > > +       cred = current_cred();
> > > +       tty = audit_get_tty();
> > > +       audit_log_format(ab, " pid=%u uid=%u auid=%u tty=%s ses=%u",
> > > +                        task_pid_nr(current),
> > > +                        from_kuid(&init_user_ns, cred->uid),
> > > +                        from_kuid(&init_user_ns,
> > > audit_get_loginuid(current)), +                        tty ?
> > > tty_name(tty) : "(none)",
> > > +                        audit_get_sessionid(current));
> > > +       audit_put_tty(tty);
> > > +       audit_log_task_context(ab); /* subj= */
> > > +       audit_log_format(ab, " comm=");
> > > +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> > > +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> > > +
> > > 
> > >         audit_log_end(ab);
> > >  
> > >  }
> > >  EXPORT_SYMBOL_GPL(__audit_log_nfcfg);
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

