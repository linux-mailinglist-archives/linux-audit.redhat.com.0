Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 767C81BE9F2
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 23:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588196037;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OVOf9DwdaS7uBHmRPAs+24DyN6jO5olaxYrRk74YIUc=;
	b=AtBQV9P3st8fabK4zAqjnF5KOfd4q3xEb3dgVK4fZfzUCatIkbzYMMbhGyFotsPsfn4/8D
	0fUTrsIjWN2I+icwAGtbG/aDI7VlcUxy63KrhJrLSZpL/nZJeFLaCfUtevpyrWAtAf23gF
	dfK70lCKpLrlqONeY0hJWKPIwumAErw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-aavtrpifMwCghNvkkLx_ag-1; Wed, 29 Apr 2020 17:33:55 -0400
X-MC-Unique: aavtrpifMwCghNvkkLx_ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AFBC1920E69;
	Wed, 29 Apr 2020 21:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B30D5C241;
	Wed, 29 Apr 2020 21:33:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22CC31809542;
	Wed, 29 Apr 2020 21:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TLX0Il014937 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 17:33:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45E5266065; Wed, 29 Apr 2020 21:33:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 148066607E;
	Wed, 29 Apr 2020 21:32:50 +0000 (UTC)
Date: Wed, 29 Apr 2020 17:32:47 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Message-ID: <20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
References: <cover.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200429143146.3vlcmwvljo74ydb4@madcap2.tricolour.ca>
	<3348737.k9gCtgYObn@x2>
MIME-Version: 1.0
In-Reply-To: <3348737.k9gCtgYObn@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-29 14:47, Steve Grubb wrote:
> On Wednesday, April 29, 2020 10:31:46 AM EDT Richard Guy Briggs wrote:
> > On 2020-04-28 18:25, Paul Moore wrote:
> > > On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> 
> wrote:
> > > > Some table unregister actions seem to be initiated by the kernel to
> > > > garbage collect unused tables that are not initiated by any userspace
> > > > actions.  It was found to be necessary to add the subject credentials
> > > > to  cover this case to reveal the source of these actions.  A sample
> > > > record:
> > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat
> > > >   family=bridge entries=0 op=unregister pid=153 uid=root auid=unset
> > > >   tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0
> > > >   comm=kworker/u4:2 exe=(null)> 
> > > [I'm going to comment up here instead of in the code because it is a
> > > bit easier for everyone to see what the actual impact might be on the
> > > records.]
> > > 
> > > Steve wants subject info in this case, okay, but let's try to trim out
> > > some of the fields which simply don't make sense in this record; I'm
> > > thinking of fields that are unset/empty in the kernel case and are
> > > duplicates of other records in the userspace/syscall case.  I think
> > > that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> > 
> > From the ghak28 discussion, this list and order was selected due to
> > Steve's preference for the "kernel" record convention, so deviating from
> > this will create yet a new field list.  I'll defer to Steve on this.  It
> > also has to do with the searchability of fields if they are missing.
> > 
> > I do agree that some fields will be superfluous in the kernel case.
> > The most important field would be "subj", but then "pid" and "comm", I
> > would think.  Based on this contents of the "subj" field, I'd think that
> > "uid", "auid", "tty", "ses" and "exe" are not needed.
> 
> We can't be adding deleting fields based on how its triggered. If they are 
> unset, that is fine. The main issue is they have to behave the same.

I don't think the intent was to have fields swing in and out depending
on trigger.  The idea is to potentially permanently not include them in
this record type only.  The justification is that where they aren't
needed for the kernel trigger situation it made sense to delete them
because if it is a user context event it will be accompanied by a
syscall record that already has that information and there would be no
sense in duplicating it.

> > > While "auid" is a potential target for removal based on the
> > > dup-or-unset criteria, I think it falls under Steve's request for
> > > subject info here, even if it is garbage in this case.
> 
> auid is always unset for daemons. We do not throw it away because of that.
> 
> -Steve
> 
> > If we keep auid, I'd say keep ses, since they usually go together,
> > though they are separated by another field in this "kernel" record field
> > ordering.
> > 
> > I expect this orphan record to occur so infrequently that I don't think
> > bandwidth or space are a serious concern.
> > 
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > > 
> > > >  kernel/auditsc.c | 18 ++++++++++++++++++
> > > >  1 file changed, 18 insertions(+)
> > > > 
> > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > index d281c18d1771..d7a45b181be0 100644
> > > > --- a/kernel/auditsc.c
> > > > +++ b/kernel/auditsc.c
> > > > @@ -2557,12 +2557,30 @@ void __audit_log_nfcfg(const char *name, u8 af,
> > > > unsigned int nentries,> > 
> > > >                        enum audit_nfcfgop op)
> > > >  
> > > >  {
> > > >  
> > > >         struct audit_buffer *ab;
> > > > 
> > > > +       const struct cred *cred;
> > > > +       struct tty_struct *tty;
> > > > +       char comm[sizeof(current->comm)];
> > > > 
> > > >         ab = audit_log_start(audit_context(), GFP_KERNEL,
> > > >         AUDIT_NETFILTER_CFG);
> > > >         if (!ab)
> > > >         
> > > >                 return;
> > > >         
> > > >         audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
> > > >         
> > > >                          name, af, nentries, audit_nfcfgs[op].s);
> > > > 
> > > > +
> > > > +       cred = current_cred();
> > > > +       tty = audit_get_tty();
> > > > +       audit_log_format(ab, " pid=%u uid=%u auid=%u tty=%s ses=%u",
> > > > +                        task_pid_nr(current),
> > > > +                        from_kuid(&init_user_ns, cred->uid),
> > > > +                        from_kuid(&init_user_ns,
> > > > audit_get_loginuid(current)), +                        tty ?
> > > > tty_name(tty) : "(none)",
> > > > +                        audit_get_sessionid(current));
> > > > +       audit_put_tty(tty);
> > > > +       audit_log_task_context(ab); /* subj= */
> > > > +       audit_log_format(ab, " comm=");
> > > > +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> > > > +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> > > > +
> > > > 
> > > >         audit_log_end(ab);
> > > >  
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(__audit_log_nfcfg);
> > 
> > - RGB

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

