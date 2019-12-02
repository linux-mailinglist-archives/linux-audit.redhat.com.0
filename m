Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD24210F5EA
	for <lists+linux-audit@lfdr.de>; Tue,  3 Dec 2019 04:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575345015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V1fQD8Gtz/6hmn9XmqaqZTbk7jq3SH0EMFoCA+qBY/Q=;
	b=TbDd5ZppZr1qn5YdflXD1MXgfksgicJe5dKuaPWrt6AMDkcfWe712vOC1vlKNQGTf2k7Md
	KbaswLklZd1747u4ITfECZhBADJD7R9ygQ6f4CtEcIZThOr74GxjmJkKUvh21aXW1ZXkQe
	0LOTE4QZMbZsUXSOKJICrerrGderNDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Hxi9fOp7OzOZnsJ4O2ZshQ-1; Mon, 02 Dec 2019 22:50:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE17EDB24;
	Tue,  3 Dec 2019 03:50:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7365C290;
	Tue,  3 Dec 2019 03:50:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F6514EDAF;
	Tue,  3 Dec 2019 03:50:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2NYfFx025797 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 18:34:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7319A2038B96; Mon,  2 Dec 2019 23:34:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E1D12026D69
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:34:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E4F580019B
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 23:34:39 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-GhRdFguUMcGoveQJZlFswg-1; Mon, 02 Dec 2019 18:34:35 -0500
Received: by mail-pl1-f196.google.com with SMTP id o9so755827plk.6
	for <linux-audit@redhat.com>; Mon, 02 Dec 2019 15:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Z3rcMZkJZGj62FT1K1YiTzywyH6333nfY23ubK0gAps=;
	b=tuCSUFTXPAj//1PDb8w/ZKSqDNVCzJLtrO7UweLxucToHuoGl9X1xXY47pCtLs54oW
	8LUHNpxAv3g1/juN2/RFiluozGyn89+cB+csUf4EIMgIz9///KtXF4TvUUunH/9dTrS8
	/dxVH6V3ismzUKVi7PrwaifYoRCGU+VB/n7PsxEjhe3rMCMgFReteqWQP/oTolEH7Dw+
	L+eLd+iF970kaEgUjvpoi6GeF0w/TFUdCmXWb45AcP828tkmw/TSs8soqk0t5Gl0QDro
	nwZkoV1O/zPV795lotRbkxTZS3E4eVGiCACzacNJALHu2I1mH85jdLx6TMtMpbliXuya
	8Ppg==
X-Gm-Message-State: APjAAAWZFh8suiekmZEkhOCWvYEdUpurwjfxzW2DIDvn1D7hRl+rdJLJ
	xDb1jvCuhOtHn2eU1LqFJHmDHg==
X-Google-Smtp-Source: APXvYqxez88BfsSLdu0FphGWimROK+AQJM1Q600m7NCFYfCJF83uF/DiHX9wb+ydfYGeHCbWMkiGHQ==
X-Received: by 2002:a17:902:54f:: with SMTP id
	73mr1882143plf.213.1575329673560; 
	Mon, 02 Dec 2019 15:34:33 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id f13sm617154pfa.57.2019.12.02.15.34.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 15:34:32 -0800 (PST)
Date: Mon, 2 Dec 2019 18:34:31 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
Message-ID: <20191202233431.GM17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
	<20191202211915.GF17234@google.com>
	<20191202172639.1c9ad544@gandalf.local.home>
MIME-Version: 1.0
In-Reply-To: <20191202172639.1c9ad544@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: GhRdFguUMcGoveQJZlFswg-1
X-MC-Unique: Hxi9fOp7OzOZnsJ4O2ZshQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2NYfFx025797
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 22:49:48 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 02, 2019 at 05:26:39PM -0500, Steven Rostedt wrote:
> On Mon, 2 Dec 2019 16:19:15 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > Good idea to CC the following on RCU patches:
> > Paul McKenney
> > Steven Rostedt
> 
> I'm fine with this if it doesn't cause any rcu splats with sparse. Not
> sure if use cases of RCU requires RCU maintainers Cc'd. Although we can
> usually keep people from misusing it ;-)

Yes true :) Thanks for taking a look.

 - Joel

> 
> -- Steve
> 
> 
> > (Any others on the RCU maintainers list).
> > And, the list: rcu@vger.kernel.org
> > 
> > Could anyone Ack the patch? Looks safe and straight forward.
> > 
> > On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> > > 
> > > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > > hence it must be annotated with __rcu for sparse to report
> > > warnings/errors correctly.
> > > 
> > > Fix multiple instances of the sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
> > > 
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > > v3:
> > > - update changelog to be more descriptive
> > > 
> > > v2:
> > > - fix erroneous RCU pointer initialization
> > >  
> > >  kernel/audit.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index da8dc0db5bd3..ff7cfc61f53d 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -102,12 +102,13 @@ struct audit_net {
> > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > >   * or the associated spinlock for writing.
> > >   */
> > > -static struct auditd_connection {
> > > +struct auditd_connection {
> > >  	struct pid *pid;
> > >  	u32 portid;
> > >  	struct net *net;
> > >  	struct rcu_head rcu;
> > > -} *auditd_conn = NULL;
> > > +};
> > > +static struct auditd_connection __rcu *auditd_conn;
> > >  static DEFINE_SPINLOCK(auditd_conn_lock);
> > >  
> > >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > > -- 
> > > 2.24.0
> > >   
> 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

