Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CF25410F2E7
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 23:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575326267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jojpCfkc3p3uiJ3PBjk0ApUJHRPC6ZEz1QYHhAM0eBo=;
	b=gI0tvRba9m7eyNmc9nS90YuATdCGAAxK5OVlQNQntsHEbkUQnm6Tt+TsWP6goUYyC2kCpe
	i0EHEZcvl24iKmte3qZJv5yXu6wlHlvoW85OULz1O61utG7DMz+gCbWQeIGFfLFAm1TeyS
	ZU1u9t6bpC/9Ha/+80aXYoVrkj22Pt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-tZoPNcg6MsWj6tQ51Il3gg-1; Mon, 02 Dec 2019 17:37:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24108017CC;
	Mon,  2 Dec 2019 22:37:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB2219C68;
	Mon,  2 Dec 2019 22:37:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC5904EDAD;
	Mon,  2 Dec 2019 22:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2MZwc0021645 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 17:35:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F81EDA69F; Mon,  2 Dec 2019 22:35:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B45CAF9A0
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 22:35:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2F78905989
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 22:35:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-406-AZxizQV1P7-IrIG_nvj8Uw-1;
	Mon, 02 Dec 2019 17:35:52 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
	[66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 45A1A2073C;
	Mon,  2 Dec 2019 22:26:41 +0000 (UTC)
Date: Mon, 2 Dec 2019 17:26:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
Message-ID: <20191202172639.1c9ad544@gandalf.local.home>
In-Reply-To: <20191202211915.GF17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
	<20191202211915.GF17234@google.com>
MIME-Version: 1.0
X-MC-Unique: AZxizQV1P7-IrIG_nvj8Uw-1
X-MC-Unique: tZoPNcg6MsWj6tQ51Il3gg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2MZwc0021645
X-loop: linux-audit@redhat.com
Cc: paulmck@kernel.org, Amol Grover <frextrite@gmail.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2 Dec 2019 16:19:15 -0500
Joel Fernandes <joel@joelfernandes.org> wrote:

> Good idea to CC the following on RCU patches:
> Paul McKenney
> Steven Rostedt

I'm fine with this if it doesn't cause any rcu splats with sparse. Not
sure if use cases of RCU requires RCU maintainers Cc'd. Although we can
usually keep people from misusing it ;-)

-- Steve


> (Any others on the RCU maintainers list).
> And, the list: rcu@vger.kernel.org
> 
> Could anyone Ack the patch? Looks safe and straight forward.
> 
> On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> > 
> > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > hence it must be annotated with __rcu for sparse to report
> > warnings/errors correctly.
> > 
> > Fix multiple instances of the sparse error:
> > error: incompatible types in comparison expression
> > (different address spaces)
> > 
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> > v3:
> > - update changelog to be more descriptive
> > 
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
> >   


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

