Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 781BC19EEB1
	for <lists+linux-audit@lfdr.de>; Mon,  6 Apr 2020 01:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586130707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pgu/E2chrUWcpZXG+dQz2eh6Xs/WYMkW2UVPVYnlhK4=;
	b=cBxLGUllYnzg4EoCqjw+uefXSayoz+JDj3YGSlTxVnte8jcF8YQ2kzLbhMZfv3MQJslh0c
	vKWgeyqGITVskt63mqlamBFgvmE1hx5K9WY3Ff0/Eikrt4k7570VSrRMdq2SVpJ+WGaYfJ
	4KeDrVej8HvKe1GJ89aHPdr8eSIdpkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-wDYztHP5NPWCHMtMVBvvlQ-1; Sun, 05 Apr 2020 19:51:44 -0400
X-MC-Unique: wDYztHP5NPWCHMtMVBvvlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A96800D50;
	Sun,  5 Apr 2020 23:51:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1C710027AF;
	Sun,  5 Apr 2020 23:51:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 942E7944DA;
	Sun,  5 Apr 2020 23:51:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0342rKI2000920 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 22:53:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 447295C3F8; Sat,  4 Apr 2020 02:53:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1D55C28F;
	Sat,  4 Apr 2020 02:53:07 +0000 (UTC)
Date: Fri, 3 Apr 2020 22:53:04 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 3/3 RESEND] auditsc: Do not use RCU primitive to read
	from cred pointer
Message-ID: <20200404025304.llfj5xw23sapifgm@madcap2.tricolour.ca>
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200402055640.6677-3-frextrite@gmail.com>
	<CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
	<20200403075613.GA2788@workstation-portable>
	<20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
	<CAHC9VhTKPvJCsqS9dNg_MSfR1xaHuxhVSJixNPLoAgdC+WqeeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTKPvJCsqS9dNg_MSfR1xaHuxhVSJixNPLoAgdC+WqeeA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 05 Apr 2020 19:51:07 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-03 17:43, Paul Moore wrote:
> On Fri, Apr 3, 2020 at 5:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-04-03 13:26, Amol Grover wrote:
> > > On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > > > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > > > task_struct::cred is only used task-synchronously and does
> > > > > not require any RCU locks, hence, rcu_dereference_check is
> > > > > not required to read from it.
> > > > >
> > > > > Suggested-by: Jann Horn <jannh@google.com>
> > > > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > > ---
> > > > >  kernel/auditsc.c | 15 +++++----------
> > > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > > >
> > > > This is the exact same patch I ACK'd back in February, yes?
> > > >
> > > > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> > > >
> > >
> > > Hi Paul,
> > >
> > > That's correct. I've resend the series out of the fear that the first 2
> > > patches might've gotten lost as it's been almost a month since I last
> > > sent them. Could you please ack this again, and if you don't mind could
> > > you please go through the other 2 patches and ack them aswell?
> >
> > Via who's tree are you expecting this will make it upstream?
> 
> When I asked a similar question back in February the response was
> basically not the audit tree.

Well, I went checking mingo and akpm's trees and didn't find 1/3 and 2/3
there even though I thought 3/3 was in audit/stable-5.6.  I was mistaken,
that patch in audit/stable-5.6 is a previous rcu fix for auditd_conn and
not 3/3.

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

