Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB7219E093
	for <lists+linux-audit@lfdr.de>; Fri,  3 Apr 2020 23:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585950990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IfIuzCgs7cvgvPMb2JVQl4BqjkVHdEPLgibom5zgQ/A=;
	b=coZmuy6DW6S1GEYz+Xcsz8kG/cCTGOCTgs6ZCDBWauw9EG0rvNerNWoP3QyUFPcELh0Rk9
	e8E/0oONLqxxNPU5BJNUeGJCmvhI+rUSJ4MMF+6cJt3+Rd+Ng/nPEcEAzBl8/yTB5u4UW6
	ziDdybl5LcgJZnLKEPWhPVpV3Jr18cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-0ysDvRMTOUGZkJsRleFVpw-1; Fri, 03 Apr 2020 17:56:27 -0400
X-MC-Unique: 0ysDvRMTOUGZkJsRleFVpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4761005509;
	Fri,  3 Apr 2020 21:56:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB2976EF97;
	Fri,  3 Apr 2020 21:56:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DC7C4E444;
	Fri,  3 Apr 2020 21:56:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033LiD1K019707 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 17:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF80C14E795; Fri,  3 Apr 2020 21:44:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C8E13D719
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 21:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3636D8FF663
	for <linux-audit@redhat.com>; Fri,  3 Apr 2020 21:44:11 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-5Br3O-D2PVCL7hj6eEk2Ww-1; Fri, 03 Apr 2020 17:44:09 -0400
X-MC-Unique: 5Br3O-D2PVCL7hj6eEk2Ww-1
Received: by mail-ed1-f66.google.com with SMTP id a43so11065919edf.6
	for <linux-audit@redhat.com>; Fri, 03 Apr 2020 14:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vrK7vwUeUnQBBKtc7jLVryrHjAhV8bpINdD94AtArAQ=;
	b=PpuS/iMtoWaLxNm1o+E1T+mfMNxCf4zyLgFCYm4/DqgyQmWLr7kWL7oDwNowXIHEq7
	IIo6Pqk/ViwO+9aIWIwlRVr8yT8Zm5NsDbpf5A0YHSllDPi4L3/1rhnW20p5l0zilp4M
	1on2dcIjv3TgI0s2rG8FuxEITQ6/zLinLYOPkOrFowGlaAQLZUE7Cj5mLvrvaV9vm2AS
	acEoaXwlm5Lrzn0LDZU5bJYnrOv31DiNdfZvLiFNt8+gIepC7MQRGtHuHzXHQwEmyb6K
	zuL2HeGRJtH7fF0EJJ2p8yQQXYo4nAAPViAi1soeMShp3tFHV1n3RhY0f8qJVgSGBuqm
	T2uw==
X-Gm-Message-State: AGi0PuYkuepbMBh5GDkh5F7eFIMzuGqxh4ryX0h4PTHbdIi1bgOdibex
	9EyjAJ0su2hEtc8lxEJH7xXKz2RXT88OSLU8OmmP
X-Google-Smtp-Source: APiQypL59OxS7QNGPWqemd6Y/5Vu/44PzNASHeGhEZ++QX22x2xMJLmmDasdvS6/rH/XJN9sN5fraRX5tZkWBVbXnpo=
X-Received: by 2002:a17:906:b2c7:: with SMTP id
	cf7mr10678793ejb.271.1585950247447; 
	Fri, 03 Apr 2020 14:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
	<CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
	<20200403075613.GA2788@workstation-portable>
	<20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
In-Reply-To: <20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Apr 2020 17:43:56 -0400
Message-ID: <CAHC9VhTKPvJCsqS9dNg_MSfR1xaHuxhVSJixNPLoAgdC+WqeeA@mail.gmail.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read from
	cred pointer
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033LiD1K019707
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 03 Apr 2020 17:56:08 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Amol Grover <frextrite@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, Ben Segall <bsegall@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	James Morris <jamorris@linux.microsoft.com>,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
	Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	David Howells <dhowells@redhat.com>,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Andrew Morton <akpm@linux-foundation.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 3, 2020 at 5:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-03 13:26, Amol Grover wrote:
> > On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > > task_struct::cred is only used task-synchronously and does
> > > > not require any RCU locks, hence, rcu_dereference_check is
> > > > not required to read from it.
> > > >
> > > > Suggested-by: Jann Horn <jannh@google.com>
> > > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > ---
> > > >  kernel/auditsc.c | 15 +++++----------
> > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > >
> > > This is the exact same patch I ACK'd back in February, yes?
> > >
> > > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> > >
> >
> > Hi Paul,
> >
> > That's correct. I've resend the series out of the fear that the first 2
> > patches might've gotten lost as it's been almost a month since I last
> > sent them. Could you please ack this again, and if you don't mind could
> > you please go through the other 2 patches and ack them aswell?
>
> Via who's tree are you expecting this will make it upstream?

When I asked a similar question back in February the response was
basically not the audit tree.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

