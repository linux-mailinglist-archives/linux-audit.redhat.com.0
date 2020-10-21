Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06AD32950FE
	for <lists+linux-audit@lfdr.de>; Wed, 21 Oct 2020 18:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603298423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=10pSAqXWoo50LqD/v4S6oFWkm8WGhvLgkkOhlyFcnSg=;
	b=YCA12EOgNqa3Eof2tWNYnVq9jM66uOCiyMroL7xxPFP3bkahFNcyNu+26ikz3Uy5Iwlw8S
	a+qeyviSy/R4o7SKuHTyrUYYZyDTWFw5m34IfPhmPBYLbrBnasKjohtlTUEKdujBqRXCiM
	WnF0rP0Jg5kTpDRTvGZe6pf9iW65UsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-yLKwX3VGPwKeaKM65_3HIw-1; Wed, 21 Oct 2020 12:40:18 -0400
X-MC-Unique: yLKwX3VGPwKeaKM65_3HIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B70780B71F;
	Wed, 21 Oct 2020 16:40:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5555D9DD;
	Wed, 21 Oct 2020 16:40:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDE13181A71F;
	Wed, 21 Oct 2020 16:40:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LGdf4W006876 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 12:39:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93B3027CC3; Wed, 21 Oct 2020 16:39:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC5E27CC1;
	Wed, 21 Oct 2020 16:39:28 +0000 (UTC)
Date: Wed, 21 Oct 2020 12:39:26 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
Message-ID: <20201021163926.GA3929765@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
	<CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
	<20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
	<CAHC9VhRUwCKBjffA_XNSjUwvUn8e6zfmy8WD203dK7R2KD0__g@mail.gmail.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20201002195231.GH2882171@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-10-02 15:52, Richard Guy Briggs wrote:
> On 2020-08-21 15:15, Paul Moore wrote:
> > On Wed, Jul 29, 2020 at 3:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-07-05 11:10, Paul Moore wrote:
> > > > On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > 
> > ...
> > 
> > > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > > index f03d3eb0752c..9e79645e5c0e 100644
> > > > > --- a/kernel/auditsc.c
> > > > > +++ b/kernel/auditsc.c
> > > > > @@ -1458,6 +1466,7 @@ static void audit_log_exit(void)
> > > > >         struct audit_buffer *ab;
> > > > >         struct audit_aux_data *aux;
> > > > >         struct audit_names *n;
> > > > > +       struct audit_contobj *cont;
> > > > >
> > > > >         context->personality = current->personality;
> > > > >
> > > > > @@ -1541,7 +1550,7 @@ static void audit_log_exit(void)
> > > > >         for (aux = context->aux_pids; aux; aux = aux->next) {
> > > > >                 struct audit_aux_data_pids *axs = (void *)aux;
> > > > >
> > > > > -               for (i = 0; i < axs->pid_count; i++)
> > > > > +               for (i = 0; i < axs->pid_count; i++) {
> > > > >                         if (audit_log_pid_context(context, axs->target_pid[i],
> > > > >                                                   axs->target_auid[i],
> > > > >                                                   axs->target_uid[i],
> > > > > @@ -1549,14 +1558,20 @@ static void audit_log_exit(void)
> > > > >                                                   axs->target_sid[i],
> > > > >                                                   axs->target_comm[i]))
> > > > >                                 call_panic = 1;
> > > > > +                       audit_log_container_id(context, axs->target_cid[i]);
> > > > > +               }
> > > >
> > > > It might be nice to see an audit event example including the
> > > > ptrace/signal information.  I'm concerned there may be some confusion
> > > > about associating the different audit container IDs with the correct
> > > > information in the event.
> > >
> > > This is the subject of ghat81, which is a test for ptrace and signal
> > > records.
> > >
> > > This was the reason I had advocated for an op= field since there is a
> > > possibility of multiple contid records per event.
> > 
> > I think an "op=" field is the wrong way to link audit container ID to
> > a particular record.  It may be convenient, but I fear that it would
> > be overloading the field too much.
> 
> Ok, after looking at the field dictionary how about item, rel, ref or rec?
> Item perhaps could be added to the OBJ_PID records, but that might be
> overloading a field that is already used in PATH records.  "rel" for
> relates-to, "ref" for reference to, "rec" for record...  Perhaps pid=
> would be enough to tie this record to the OBJ_PID record or the SYSCALL
> record, but in the case of network events, the pid may refer to a kernel
> thread.
> 
> > Like I said above, I think it would be good to see an audit event
> > example including the ptrace/signal information.  This way we can talk
> > about it on-list and hash out the various solutions if it proves to be
> > a problem.
> 
> See the list posting from 2020-09-29 "auditing signals" pointing to
> ghat81 test case about testing ptrace and signals from 18 months ago.
> 
> I think I have a way to generate a signal to multiple targets in one
> syscall...  The added challenge is to also give those targets different
> audit container identifiers.

Here is an exmple I was able to generate after updating the testsuite
script to include a signalling example of a nested audit container
identifier:

----
type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) : proctitle=/usr/bin/perl -w containerid/test
type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=7129731255799087104^3333941723245477888
type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=3333941723245477888
type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=8098399240850112512^3333941723245477888
type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) : arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testsuite-1603290671-AcLtUulY                     
----

There are three CONTAINER_ID records which need some way of associating with OBJ_PID records.  An additional CONTAINER_ID record would be present if the killing process itself had an audit container identifier.  I think the most obvious way to connect them is with a pid= field in the CONTAINER_ID record.

> > > > > @@ -1575,6 +1590,14 @@ static void audit_log_exit(void)
> > > > >
> > > > >         audit_log_proctitle();
> > > > >
> > > > > +       rcu_read_lock();
> > > > > +       cont = _audit_contobj_get(current);
> > > > > +       rcu_read_unlock();
> > > > > +       audit_log_container_id(context, cont);
> > > > > +       rcu_read_lock();
> > > > > +       _audit_contobj_put(cont);
> > > > > +       rcu_read_unlock();
> > > >
> > > > Do we need to grab an additional reference for the audit container
> > > > object here?  We don't create any additional references here that
> > > > persist beyond the lifetime of this function, right?
> > >
> > > Why do we need another reference?  There's one for each pointer pointing
> > > to it and so far we have just one from this task.  Or are you thinking
> > > of the contid hash list, which is only added to when a task points to it
> > > and gets removed from that list when the last task stops pointing to it.
> > > Later that gets more complicated with network namespaces and nested
> > > container objects.  For now we just needed it while generating the
> > > record, then it gets freed.
> > 
> > I don't think we need to grab an additional reference here, that is
> > why I asked the question.  The code above grabs a reference for the
> > audit container ID object associated with the current task and then
> > drops it before returning; if the current task, and it's associated
> > audit container ID object, disappears in the middle of the function
> > we've got much bigger worries :)
> 
> I misunderstood your question previously thinking you wanted yet another
> reference taken in this case, when in fact it was the opposite and you
> thought the one taken here was superfluous.
> 
> I don't *need* to grab the additional references here, but those are the
> accessor functions that exist, so I either create sub-accessor functions
> without the refcount manipulations that called from the primary accessor
> functions or open code a reduncancy...  The locking has been updated to
> protect the _put by a spin-lock.  Now that I look at it, the 4th to 7th
> lines could be bypassed by a cont == NULL check.
> 
> It is somewhat hidden now since this sequence of 7 commands has been
> abstracted into another function that is called from a second location.
> 
> > paul moore
> 
> - RGB

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

