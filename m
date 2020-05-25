Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 05AD11E173C
	for <lists+linux-audit@lfdr.de>; Mon, 25 May 2020 23:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590442889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XidqXOGKp8YqSUFlsP3xmsibkDTMNsuhFGBPNhuwFwg=;
	b=jS9GzAvB9AMHXjezjJkjASO0jkWr7vuV46Uqcfjp9WMAn9qXxAeXh28miRUF3AVZsY59W2
	C/OV5nVuT8tDvYZwOVZ6Xr104XtzctKE7qmlOQsMD4J6ttaCZg7NuP02UgJlGB6n9+gMIF
	BZZWbdygprGBcHJM0am930lBBCFUw1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-KW9JaGXEO6-1ca8kP7aO5A-1; Mon, 25 May 2020 17:41:25 -0400
X-MC-Unique: KW9JaGXEO6-1ca8kP7aO5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D504C8014D7;
	Mon, 25 May 2020 21:41:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B2B183861;
	Mon, 25 May 2020 21:41:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A933654D29;
	Mon, 25 May 2020 21:41:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PI4kon030079 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 14:04:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4F9342AD2; Mon, 25 May 2020 18:04:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B7642AD8
	for <linux-audit@redhat.com>; Mon, 25 May 2020 18:04:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFDDA829DF9
	for <linux-audit@redhat.com>; Mon, 25 May 2020 18:04:44 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-tOzmQU7fMT-Bl_ykmV6jUw-1; Mon, 25 May 2020 14:04:40 -0400
X-MC-Unique: tOzmQU7fMT-Bl_ykmV6jUw-1
Received: by mail-pf1-f193.google.com with SMTP id n18so9080756pfa.2;
	Mon, 25 May 2020 11:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PAB8InMNdHtw1sY8dxXS0+RSR7K8nRd/W2k8ffZ4Q3w=;
	b=h9o4y6WGZ0Mxyt4icda8ngwY+stcW8V1L2AJifhNlnzeqBRj5IX0O/ywJP4QapJeA7
	Cr2weTxJ8xsP6Q1gwONuc/2FTJq5AVNzdVL4ll+ZaOrjThAvpexHDq9Pu1mBIJROIczM
	8T/9tApeuH5RRdmA3zx8q++1itXA9uicJv6w7VJASF3tpF9nFOkNYGABB62HfBoY+FDg
	S/y3UCnvxRFqFsiueD7NNA4DoehDQnUNjrECsEXTMCoFyrccrbQbOpC5vMqvApWD0qf0
	BDGsutT06mvFxWANo0QOd6WAjyHA6BL709JlUsi2vMpaM57xIiKaGGly2kcL1Oo2jC+w
	nWpA==
X-Gm-Message-State: AOAM531VToi+kYOkJ/gvKatnTEuMrNEMoHSLgrRUPsMqpxjzEy9czfj6
	DLZcS40ZgFxY9wt10DHFoXj8FBWnT0nvJA==
X-Google-Smtp-Source: ABdhPJyezKLdoitt2fakdRXnl6cL2BqFHQ3TU7kenobJ/b2iPakDh/rya/euYiDtrb6NEdZdJ/Onzg==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr27470706pge.294.1590429878562; 
	Mon, 25 May 2020 11:04:38 -0700 (PDT)
Received: from workstation-LAP.localdomain ([103.87.56.138])
	by smtp.gmail.com with ESMTPSA id
	k2sm13946901pfd.108.2020.05.25.11.04.28
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 May 2020 11:04:37 -0700 (PDT)
Date: Mon, 25 May 2020 23:34:21 +0530
From: Amol Grover <frextrite@gmail.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH 1/3 RESEND] sched: Remove __rcu annotation from cred
	pointer
Message-ID: <20200525180421.GA19@workstation-LAP.localdomain>
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200524081117.GA29@workstation-LAP.localdomain>
	<20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 May 2020 17:40:48 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, May 25, 2020 at 09:17:41AM -0400, Richard Guy Briggs wrote:
> On 2020-05-24 13:41, Amol Grover wrote:
> > On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > > task_struct::cred (subjective credentials) is *always* used
> > > task-synchronously, hence, does not require RCU semantics.
> > > 
> > > task_struct::real_cred (objective credentials) can be used in
> > > RCU context and its __rcu annotation is retained.
> > > 
> > > However, task_struct::cred and task_struct::real_cred *may*
> > > point to the same object, hence, the object pointed to by
> > > task_struct::cred *may* have RCU delayed freeing.
> > > 
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > 
> > Hello everyone,
> > 
> > Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> > your acks. I sent the original patch in beginning of February (~4 months
> > back) and resent the patches again in beginning of April due to lack of
> > traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> > resend patch. However these 2 patches still remain. I'd really
> > appreciate if someone reviewed them.
> 
> I asked on April 3 which upstream tree you expect this patchset to go
> through and I did not see a reply.  Do you have a specific target or is
> the large addressee list assuming someone else is taking this set?  All
> we have seen is that it is not intended to go through the audit tree.
> 

Apologies for it. As Paul Moore replied, initially I assumed this
patchset to not go through the audit tree as the audit specific changes
were secondary to the main change (though certainly I did not think
which upstream tree the patchset would go through). But now I am okay
with the patchset making it to upstream via audit tree if it is fine by
the maintainers.

Thanks
Amol

> > Thanks
> > Amol
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

