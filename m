Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 015081AE7DB
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 23:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587160469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oX85sIP5jkGm5Nq0Rq4BxDKMeEdbk9ec7q0P7MYxdAM=;
	b=P9hPEnqO6EqxJOLcmcvynb2M2I5/EyCJz3by5k55+tsAB5sWr5IxVssGlnv7O9hFTEU8Tm
	Q1BxTatKBCAODrIJKLOVukALDq1oncCCITooY27KYbqvRdLIU8uaV3SSFl1SKDQ+umEGvt
	a6aaefOT+uO6Npqcxdn3VVwD8/xiGR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-LptXKKq-MUaM13vKqrqnsg-1; Fri, 17 Apr 2020 17:54:27 -0400
X-MC-Unique: LptXKKq-MUaM13vKqrqnsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B609A8017F5;
	Fri, 17 Apr 2020 21:54:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D74AC5D9CA;
	Fri, 17 Apr 2020 21:54:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D97118089C8;
	Fri, 17 Apr 2020 21:54:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HLs5Ko004212 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 17:54:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DDFB2166B2F; Fri, 17 Apr 2020 21:54:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4212166B28
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 21:54:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD0D8EE305
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 21:54:02 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-OiEcGiNjPiq6yn1Fcsy99g-1; Fri, 17 Apr 2020 17:54:00 -0400
X-MC-Unique: OiEcGiNjPiq6yn1Fcsy99g-1
Received: by mail-ej1-f65.google.com with SMTP id a2so2674248ejx.5
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 14:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bl0pa+hbUKTXV3E8yhfZmk+igw1QNCwVFqR4CtMCNtE=;
	b=GV6UOENnouhpMjo+XHxv52bhLCkD1pYeJdqsbqo/+jsP3FxpWLgfSZGt3MlQwFbbpL
	g0mXZU61N1Ql3JpsPNDgAW5nOk42Hic5Vzl+8O/4yzoqsAG5rwh7FEZKdpAtIEgh+Y/x
	9cNxtXNPX5Rq9a1id5f5/6DDuNhnJpNC+4efxi03b0PXYSF79unUIPoB6ya0ClsD0mgM
	jmSD4d2lG+6qyGXto7NMNFCvsAALQqypi8etg1f0MWeGn/BBC7ZVnjfhv1z80ZsftHJ1
	M5stm08gHIOZwt6NG2k5YlOl+Scodn0LIPDkdSyIX6uFY/q6L7IOQebnbeTigjFsn+QZ
	SWAw==
X-Gm-Message-State: AGi0PuY5qlURq21TQS4WYcUEKaSaAiUgMD0hSpOZlyDpnbcq/WiW5yxe
	csZNWkYUzU4JekP0wz2HHU6Xj4/1E02hKeOTnPbf
X-Google-Smtp-Source: APiQypJpQfpzdeKOHwySCCbd4znVvnFmq7fAjX0Z1U3JXdJ9nI+FXYWtWqv07L9QpEU8Uqv70QvY3IRGTcQJQ/A0KtY=
X-Received: by 2002:a17:906:4cd2:: with SMTP id
	q18mr5203442ejt.70.1587160438885; 
	Fri, 17 Apr 2020 14:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584480281.git.rgb@redhat.com>
	<13ef49b2f111723106d71c1bdeedae09d9b300d8.1584480281.git.rgb@redhat.com>
	<20200318131128.axyddgotzck7cit2@madcap2.tricolour.ca>
	<CAHC9VhTdLZop0eT11H4uSXRj5M=kBet=GkA8taDwGN_BVMyhrQ@mail.gmail.com>
	<20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
In-Reply-To: <20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Apr 2020 17:53:47 -0400
Message-ID: <CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HLs5Ko004212
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2020 at 5:33 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-18 17:22, Paul Moore wrote:
> > On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > > > Some table unregister actions seem to be initiated by the kernel to
> > > > garbage collect unused tables that are not initiated by any userspace
> > > > actions.  It was found to be necessary to add the subject credentials to
> > > > cover this case to reveal the source of these actions.  A sample record:
> > > >
> > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> > >
> > > Given the precedent set by bpf unload, I'd really rather drop this patch
> > > that adds subject credentials.
> > >
> > > Similarly with ghak25's subject credentials, but they were already
> > > present and that would change an existing record format, so it isn't
> > > quite as justifiable in that case.
> >
> > Your comments have me confused - do you want this patch (v3 3/3)
> > considered for merging or no?
>
> I would like it considered for merging if you think it will be required
> to provide enough information about the event that happenned.  In the
> bpf unload case, there is a program number to provide a link to a
> previous load action.  In this case, we won't know for sure what caused
> the table to be unloaded if the number of entries was empty.  I'm still
> trying to decide if it matters.  For the sake of caution I think it
> should be included.  I don't like it, but I think it needs to be
> included.

I'm in the middle of building patches 1/3 and 2/3, assuming all goes
well I'll merge them into audit/next (expect mail soon), however I'm
going back and forth on this patch.  Like you I kinda don't like it,
and with both of us not in love with this patch I have to ask if there
is certification requirement for this?  I know about the generic
subj/obj requirements, but in the case where there is no associated
task/syscall/etc. information it isn't like the extra fields supplied
in this patch are going to have much information in that regard; it's
really the *absence* of that information which is telling.  Which
brings me to wonder if simply the lack of any associated records in
this event is enough?  Before when we weren't associating records into
a single event it would have been a problem, but the way things
currently are, if there are no other records (and you have configured
that) then I think you have everything you need to know.

Thoughts?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

