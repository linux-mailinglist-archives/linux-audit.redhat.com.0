Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C613F1AAD37
	for <lists+linux-audit@lfdr.de>; Wed, 15 Apr 2020 18:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586967337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z+IdJgEIOCYzttC5kwHlthcv7KaWp2g/8D3pGdGS8+c=;
	b=YgRsi6408CwN/DRP9W6I5n67MUH2jJP3KcLOEol+fE9gBwl0hhlOjScOF6xl5YezgVPYgQ
	zgs7VfHzLqrm4iUgTPeiB6iJqDUggtGlv7tYM9MLLVgT2gT+3fiqayrWkqb296f5zm3eG/
	63xaK2Yo3tZolkAjWwoZA4kwcOBXNwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-FMi647xdPU21aF4Jp9Ka-A-1; Wed, 15 Apr 2020 12:15:35 -0400
X-MC-Unique: FMi647xdPU21aF4Jp9Ka-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9A110509F7;
	Wed, 15 Apr 2020 16:15:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E490E99E03;
	Wed, 15 Apr 2020 16:15:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9082618089CD;
	Wed, 15 Apr 2020 16:15:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FGFIVT013529 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 12:15:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94804A63D6; Wed, 15 Apr 2020 16:15:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8D0119F56;
	Wed, 15 Apr 2020 16:15:06 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:15:03 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] kernel: audit.c: Add __rcu notation to RCU pointer
Message-ID: <20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
References: <20191128153203.GA23803@workstation-kernel-dev>
	<20191130020742.GF157739@google.com>
	<20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
	<CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Amol Grover <frextrite@gmail.com>, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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

On 2020-04-15 12:06, Paul Moore wrote:
> On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-11-29 21:07, Joel Fernandes wrote:
> > > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > > add __rcu notation to RCU protected global pointer auditd_conn
> > >
> > > Again, please use proper punctuation and captilization. This is unacceptable.
> > > Please put more effort into changelog.
> > >
> > > Otherwise the patch diff itself looks good to me, with the above nit
> > > corrected, you could add my tag to the next revision:
> > >
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > >
> > > thanks,
> > >
> > >  - Joel
> > >
> > > >
> > > > Fixes multiple instances of sparse error:
> > > > error: incompatible types in comparison expression
> > > > (different address spaces)
> >
> > Amol or Joel: Is there a reproducer recipe for this?
> 
> The commit which was merged has a slightly better description which may help.

I've already seen this.  Perhaps I should have replied to this message
instead to make that evident.  What really needed was Amol's original
message sent to this list, but it was Joel who included this list in his
reply (all 3 versions).

I'm looking for the specific setup and commands that produced this error.

>   commit cb5172d96d16df72db8b55146b0ec00bfd97f079
>   Author: Amol Grover <frextrite@gmail.com>
>   Date:   Mon Dec 2 00:03:48 2019 +0530
> 
>    audit: Add __rcu annotation to RCU pointer
> 
>    Add __rcu annotation to RCU-protected global pointer auditd_conn.
> 
>    auditd_conn is an RCU-protected global pointer,i.e., accessed
>    via RCU methods rcu_dereference() and rcu_assign_pointer(),
>    hence it must be annotated with __rcu for sparse to report
>    warnings/errors correctly.
> 
>    Fix multiple instances of the sparse error:
>    error: incompatible types in comparison expression
>    (different address spaces)
> 
>    Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>    Signed-off-by: Amol Grover <frextrite@gmail.com>
>    [PM: tweak subject line]
>    Signed-off-by: Paul Moore <paul@paul-moore.com>
> 
> -- 
> paul moore
> www.paul-moore.com
> 

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

