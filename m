Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 047491E0F54
	for <lists+linux-audit@lfdr.de>; Mon, 25 May 2020 15:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590412921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8p5ke7JIq4X9fFO6+CdoCr/6lQ/AQaJbEGJg8eMvers=;
	b=Vxc7RWO8UDZhx/YDdfAiGKCsMC6lTQ+/i/9LvI3Prwu+zGTQFxjfDa80pCpYVMpvqhXO1t
	M5J7wp3awZMzvvoV/RrIDotbDnhn3lBGYkQ0QdD2ow4Bn817Q14kECHtCV4rVf9cDxp52R
	8TXuIBUwXfFerZo1JecBmFLpdClkMm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-zjGMuvJxM-qlOhs7XRPr8Q-1; Mon, 25 May 2020 09:21:59 -0400
X-MC-Unique: zjGMuvJxM-qlOhs7XRPr8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2CB98018A7;
	Mon, 25 May 2020 13:21:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A59D95D9C5;
	Mon, 25 May 2020 13:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A95681809543;
	Mon, 25 May 2020 13:21:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PDHvnc013204 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 09:17:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80D0610013DB; Mon, 25 May 2020 13:17:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F6310013D6;
	Mon, 25 May 2020 13:17:44 +0000 (UTC)
Date: Mon, 25 May 2020 09:17:41 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH 1/3 RESEND] sched: Remove __rcu annotation from cred
	pointer
Message-ID: <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200524081117.GA29@workstation-LAP.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200524081117.GA29@workstation-LAP.localdomain>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 May 2020 09:21:28 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	David Howells <dhowells@redhat.com>,
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
	Ben Segall <bsegall@google.com>, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-24 13:41, Amol Grover wrote:
> On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > task_struct::cred (subjective credentials) is *always* used
> > task-synchronously, hence, does not require RCU semantics.
> > 
> > task_struct::real_cred (objective credentials) can be used in
> > RCU context and its __rcu annotation is retained.
> > 
> > However, task_struct::cred and task_struct::real_cred *may*
> > point to the same object, hence, the object pointed to by
> > task_struct::cred *may* have RCU delayed freeing.
> > 
> > Suggested-by: Jann Horn <jannh@google.com>
> > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> 
> Hello everyone,
> 
> Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> your acks. I sent the original patch in beginning of February (~4 months
> back) and resent the patches again in beginning of April due to lack of
> traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> resend patch. However these 2 patches still remain. I'd really
> appreciate if someone reviewed them.

I asked on April 3 which upstream tree you expect this patchset to go
through and I did not see a reply.  Do you have a specific target or is
the large addressee list assuming someone else is taking this set?  All
we have seen is that it is not intended to go through the audit tree.

> Thanks
> Amol

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

