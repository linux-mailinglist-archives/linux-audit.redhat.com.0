Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4D24E08C
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 21:15:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-9AmYDaJ5MeKfxYpRTfag_A-1; Fri, 21 Aug 2020 15:15:51 -0400
X-MC-Unique: 9AmYDaJ5MeKfxYpRTfag_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A541007469;
	Fri, 21 Aug 2020 19:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47D287C557;
	Fri, 21 Aug 2020 19:15:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AA9F662CA;
	Fri, 21 Aug 2020 19:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LJFZ8f010323 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 15:15:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0890720110C9; Fri, 21 Aug 2020 19:15:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0432E2026F94
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 19:15:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DCE7101AA40
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 19:15:32 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-527-gEYSM-zwPV-1jS-s5IWWKQ-1; Fri, 21 Aug 2020 15:15:30 -0400
X-MC-Unique: gEYSM-zwPV-1jS-s5IWWKQ-1
Received: by mail-ej1-f65.google.com with SMTP id m22so3585716eje.10
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 12:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=stghTlyBapHk994fTHtMltbLyT6mOlKKkTF189OusPI=;
	b=KcZylaBpXaoL/N7N2tGBFCUi0yIK0Inq2Z7FigHPOkyBMu9YG4pcBLBQUA6Stl0LR4
	7g7m23xQr8gTFzVL2a6NVeDpLM0SckhZrjEesu5TU1si5crO8B5Lguhxb1WGDQ6PQO0s
	HOIgk7OWxqk05ES4HBXjfDJv+1CwqFWMqRl8KORZxhDMv7SgKifdoTaDvdz0kLhJMcGB
	nfkwBI1i2wubjep28B+/S8rDKUCDuAV6NGXd5qi9YZMK8TJnv0/+gjiTtOUDJwu0KOYU
	SSIKeV0c4gPpz1aAfu9y/FmJ5DeuCx/BtlUDK6XhYSRmgd1pPWGFTuWP3Syw9WItVMAd
	mdnQ==
X-Gm-Message-State: AOAM533uhIJ7mgYvVHVtnr2NV2TkwXB8pNWoup21/ufSvy7x7aSq0l/C
	+l4f1161aBl7L2CBz7+YxtGpZBU+gbXSWiY7nwZg
X-Google-Smtp-Source: ABdhPJyjrpQ5CVzgJ6gkhEM2fio8YtcBd5YLkjExur1qaET+X/RSJIK7uZHEgYYREA2rYWWgZrtfuZgNL32OaMUA+Aw=
X-Received: by 2002:a17:906:1911:: with SMTP id
	a17mr3986360eje.431.1598037328746; 
	Fri, 21 Aug 2020 12:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
	<CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
	<20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
In-Reply-To: <20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 15:15:17 -0400
Message-ID: <CAHC9VhRUwCKBjffA_XNSjUwvUn8e6zfmy8WD203dK7R2KD0__g@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2020 at 3:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:10, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index f03d3eb0752c..9e79645e5c0e 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -1458,6 +1466,7 @@ static void audit_log_exit(void)
> > >         struct audit_buffer *ab;
> > >         struct audit_aux_data *aux;
> > >         struct audit_names *n;
> > > +       struct audit_contobj *cont;
> > >
> > >         context->personality = current->personality;
> > >
> > > @@ -1541,7 +1550,7 @@ static void audit_log_exit(void)
> > >         for (aux = context->aux_pids; aux; aux = aux->next) {
> > >                 struct audit_aux_data_pids *axs = (void *)aux;
> > >
> > > -               for (i = 0; i < axs->pid_count; i++)
> > > +               for (i = 0; i < axs->pid_count; i++) {
> > >                         if (audit_log_pid_context(context, axs->target_pid[i],
> > >                                                   axs->target_auid[i],
> > >                                                   axs->target_uid[i],
> > > @@ -1549,14 +1558,20 @@ static void audit_log_exit(void)
> > >                                                   axs->target_sid[i],
> > >                                                   axs->target_comm[i]))
> > >                                 call_panic = 1;
> > > +                       audit_log_container_id(context, axs->target_cid[i]);
> > > +               }
> >
> > It might be nice to see an audit event example including the
> > ptrace/signal information.  I'm concerned there may be some confusion
> > about associating the different audit container IDs with the correct
> > information in the event.
>
> This is the subject of ghat81, which is a test for ptrace and signal
> records.
>
> This was the reason I had advocated for an op= field since there is a
> possibility of multiple contid records per event.

I think an "op=" field is the wrong way to link audit container ID to
a particular record.  It may be convenient, but I fear that it would
be overloading the field too much.

Like I said above, I think it would be good to see an audit event
example including the ptrace/signal information.  This way we can talk
about it on-list and hash out the various solutions if it proves to be
a problem.

> > > @@ -1575,6 +1590,14 @@ static void audit_log_exit(void)
> > >
> > >         audit_log_proctitle();
> > >
> > > +       rcu_read_lock();
> > > +       cont = _audit_contobj_get(current);
> > > +       rcu_read_unlock();
> > > +       audit_log_container_id(context, cont);
> > > +       rcu_read_lock();
> > > +       _audit_contobj_put(cont);
> > > +       rcu_read_unlock();
> >
> > Do we need to grab an additional reference for the audit container
> > object here?  We don't create any additional references here that
> > persist beyond the lifetime of this function, right?
>
> Why do we need another reference?  There's one for each pointer pointing
> to it and so far we have just one from this task.  Or are you thinking
> of the contid hash list, which is only added to when a task points to it
> and gets removed from that list when the last task stops pointing to it.
> Later that gets more complicated with network namespaces and nested
> container objects.  For now we just needed it while generating the
> record, then it gets freed.

I don't think we need to grab an additional reference here, that is
why I asked the question.  The code above grabs a reference for the
audit container ID object associated with the current task and then
drops it before returning; if the current task, and it's associated
audit container ID object, disappears in the middle of the function
we've got much bigger worries :)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

