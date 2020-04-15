Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E7C651AABF5
	for <lists+linux-audit@lfdr.de>; Wed, 15 Apr 2020 17:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586964905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DMAtoG2QLvfBR3RWq9Ov1fWW+QnC+CTZHh8QgyWoCIY=;
	b=RZr/wZ4HEZ+rBJbjPmCk7fpcnP8wvGjExtw5o7eEh7mUt9R9R0lRr1PMQ+oEl74iw9OSM1
	Q9I97kTiHPigLTqdAm7fKfS3tBwH5sdiXHuJZBm3sMl0PzHzoxPSd+UjCFqRyJvFN/+xXF
	CaPn6cMKIs5VdvRZH1gAijR8juRiwsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-IzxKrou8PBmFmGr164Re8Q-1; Wed, 15 Apr 2020 11:35:03 -0400
X-MC-Unique: IzxKrou8PBmFmGr164Re8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ECA91005509;
	Wed, 15 Apr 2020 15:34:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B404A0986;
	Wed, 15 Apr 2020 15:34:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A2FB18089CD;
	Wed, 15 Apr 2020 15:34:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FFYRGC010882 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 11:34:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B842960BEC; Wed, 15 Apr 2020 15:34:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E200560BF1;
	Wed, 15 Apr 2020 15:34:20 +0000 (UTC)
Date: Wed, 15 Apr 2020 11:34:17 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH v2] kernel: audit.c: Add __rcu notation to RCU pointer
Message-ID: <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
References: <20191128153203.GA23803@workstation-kernel-dev>
	<20191130020742.GF157739@google.com>
MIME-Version: 1.0
In-Reply-To: <20191130020742.GF157739@google.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-audit@redhat.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, Amol Grover <frextrite@gmail.com>
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

On 2019-11-29 21:07, Joel Fernandes wrote:
> On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > add __rcu notation to RCU protected global pointer auditd_conn
> 
> Again, please use proper punctuation and captilization. This is unacceptable.
> Please put more effort into changelog.
> 
> Otherwise the patch diff itself looks good to me, with the above nit
> corrected, you could add my tag to the next revision:
> 
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> thanks,
> 
>  - Joel
> 
> > 
> > Fixes multiple instances of sparse error:
> > error: incompatible types in comparison expression
> > (different address spaces)

Amol or Joel: Is there a reproducer recipe for this?

> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> > v2:
> > - fix erroneous RCU pointer initialization
> > 
> >  kernel/audit.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index da8dc0db5bd3..ff7cfc61f53d 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -102,12 +102,13 @@ struct audit_net {
> >   * This struct is RCU protected; you must either hold the RCU lock for reading
> >   * or the associated spinlock for writing.
> >   */
> > -static struct auditd_connection {
> > +struct auditd_connection {
> >  	struct pid *pid;
> >  	u32 portid;
> >  	struct net *net;
> >  	struct rcu_head rcu;
> > -} *auditd_conn = NULL;
> > +};
> > +static struct auditd_connection __rcu *auditd_conn;
> >  static DEFINE_SPINLOCK(auditd_conn_lock);
> >  
> >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > -- 
> > 2.24.0

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

