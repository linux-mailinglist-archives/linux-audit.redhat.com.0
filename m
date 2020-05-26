Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 47BD31E220F
	for <lists+linux-audit@lfdr.de>; Tue, 26 May 2020 14:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590496816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fCzgsHphaowJMh+ZGNgLbinsdiBfhh54VDkQxU/jZLA=;
	b=NxTbcuPC3DxVlC0IFL+D40ZsuvH7a12SUn2sZZzZg8Y7DeJx+FOmRcrna2ZAR262XS5Qqg
	fHLUXUq6dXJK6hDB1/E3nJ0pbI4ppGodkZeJ/LqjCxhMAIRssEmb+HEjTbtEjdRzbVqHaT
	7BoI/nR2oI4rL5LQcCCRISRbV3xwRs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-IdiUWkxaOlSoSCF8GPYaug-1; Tue, 26 May 2020 08:40:14 -0400
X-MC-Unique: IdiUWkxaOlSoSCF8GPYaug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EAA61005512;
	Tue, 26 May 2020 12:40:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC7510013DB;
	Tue, 26 May 2020 12:40:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E18531809541;
	Tue, 26 May 2020 12:40:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QCYr9C008394 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 08:34:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AB2E9D72; Tue, 26 May 2020 12:34:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867649D63
	for <linux-audit@redhat.com>; Tue, 26 May 2020 12:34:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9880F101A525
	for <linux-audit@redhat.com>; Tue, 26 May 2020 12:34:49 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-65-A1gAMlcDPK2WXKCWJE_ElA-1; Tue, 26 May 2020 08:34:45 -0400
X-MC-Unique: A1gAMlcDPK2WXKCWJE_ElA-1
Received: by mail-ed1-f68.google.com with SMTP id s19so17471248edt.12
	for <linux-audit@redhat.com>; Tue, 26 May 2020 05:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JUFqBLf1RiIPnvjRp2NeVt7jf0hFenXjeR9kjT+Rdf0=;
	b=fG+gehm5ONGe48hICbrHttEhbhdWITQD7aoXWIeJL/vvPvs9UHrnjD09aJOttMkS0s
	sQJk0KFycYBjqklAjqg/BbJK24eQW102SQfek2R45fvXl5pO6oGOYviinfAOsQv7H/uv
	eVoTUz5m1/DdWUxc6BJnltpV8nbvhrK6SbrIL6RCOOjv8OfQaDw/8p5qHy4rEk6YpkOq
	23orZe/r1PBD6gPvJHjyEV4DD+hWLSAOSKhw5ArYICIhT+y8kiVCM7veDCiifBmaD5Zc
	cb0ATzicS46itc54yo2yG93CWcJzAAOpDz/6luuVzE7Mbh5CXNW6mUhkScXfzCn0Crer
	nbaQ==
X-Gm-Message-State: AOAM532zqn7KJRMOxmanSJPXyWZfstxUUy8SGhIpw/28egHOmJpngqyR
	RQkHvKKJh2RJveVFuDgFqaZ/7IzBvHFEj3n3ElN3w8w=
X-Google-Smtp-Source: ABdhPJwVhTK/f1+ttt/wIH/DF4otAgZkYmCBshCaTHZu+pV434ay6yyTjaqEoYxYdPBJpQQXAqjcQZ1DMw1Wtx1TaHg=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr16099251edy.128.1590496483906;
	Tue, 26 May 2020 05:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
	<20200524081117.GA29@workstation-LAP.localdomain>
	<20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
	<20200525180421.GA19@workstation-LAP.localdomain>
In-Reply-To: <20200525180421.GA19@workstation-LAP.localdomain>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 May 2020 08:34:33 -0400
Message-ID: <CAHC9VhQ_jNbNFChy3i6AfmOkEQtER_pxrd5uCJwpfNeedyUM4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3 RESEND] sched: Remove __rcu annotation from cred
	pointer
To: Amol Grover <frextrite@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 26 May 2020 08:40:03 -0400
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
	Ben Segall <bsegall@google.com>, Richard Guy Briggs <rgb@redhat.com>,
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

On Mon, May 25, 2020 at 2:04 PM Amol Grover <frextrite@gmail.com> wrote:
> On Mon, May 25, 2020 at 09:17:41AM -0400, Richard Guy Briggs wrote:
> > On 2020-05-24 13:41, Amol Grover wrote:
> > > On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > > > task_struct::cred (subjective credentials) is *always* used
> > > > task-synchronously, hence, does not require RCU semantics.
> > > >
> > > > task_struct::real_cred (objective credentials) can be used in
> > > > RCU context and its __rcu annotation is retained.
> > > >
> > > > However, task_struct::cred and task_struct::real_cred *may*
> > > > point to the same object, hence, the object pointed to by
> > > > task_struct::cred *may* have RCU delayed freeing.
> > > >
> > > > Suggested-by: Jann Horn <jannh@google.com>
> > > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > >
> > > Hello everyone,
> > >
> > > Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> > > your acks. I sent the original patch in beginning of February (~4 months
> > > back) and resent the patches again in beginning of April due to lack of
> > > traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> > > resend patch. However these 2 patches still remain. I'd really
> > > appreciate if someone reviewed them.
> >
> > I asked on April 3 which upstream tree you expect this patchset to go
> > through and I did not see a reply.  Do you have a specific target or is
> > the large addressee list assuming someone else is taking this set?  All
> > we have seen is that it is not intended to go through the audit tree.
> >
>
> Apologies for it. As Paul Moore replied, initially I assumed this
> patchset to not go through the audit tree as the audit specific changes
> were secondary to the main change (though certainly I did not think
> which upstream tree the patchset would go through). But now I am okay
> with the patchset making it to upstream via audit tree if it is fine by
> the maintainers.

This patchset is not appropriate for the audit tree as the most
significant changes are not audit related.

My ACK on patch 3/3 was, and is, conditional on the previous patches
being acceptable to the greater kernel community; this is the main
reason why I didn't ACK patch 1/3 or 2/3.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

