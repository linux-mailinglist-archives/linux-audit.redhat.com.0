Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 130C4131A1D
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 22:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578345107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GTnAckgLXrtFIg7XLY9sEeOxW5x3cJEMCqFKlycjIEo=;
	b=D6xr4Sx61d1Cmfx9Jru65sgeivhp1K6L4TaoOCPI9uD7NyH+N8anjYikr93YT9ouBwPOtU
	ZnFOQILNjhJ0VNxSO/T2i6BTwCW4ND63732n9ovbpi6SeoSqgdSUFqI1CoiYvfp2vX0bdd
	s43aUoryTxeUXhqnAbM8Nk58jA8IK7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-zy3OxL8lNfuvYZFOohKD3g-1; Mon, 06 Jan 2020 16:11:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7DB7800D50;
	Mon,  6 Jan 2020 21:11:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B627F474;
	Mon,  6 Jan 2020 21:11:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 432ED81C78;
	Mon,  6 Jan 2020 21:11:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006KNQH1032704 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 15:23:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C11B2022EA5; Mon,  6 Jan 2020 20:23:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 573052022EEC
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:23:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396A2800FF5
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:23:26 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-ADiapCrvMFODl_b7Vweu3A-1; Mon, 06 Jan 2020 15:23:24 -0500
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ioYuI-0006hi-4n; Mon, 06 Jan 2020 21:23:22 +0100
Date: Mon, 6 Jan 2020 21:23:22 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
Message-ID: <20200106202322.GP795@breakpoint.cc>
References: <cover.1577830902.git.rgb@redhat.com>
	<194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: ADiapCrvMFODl_b7Vweu3A-1
X-MC-Unique: zy3OxL8lNfuvYZFOohKD3g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 006KNQH1032704
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 16:11:25 -0500
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> Git context diffs were being produced with unhelpful declaration types
> in the place of function names to help identify the funciton in which
> changes were made.
> 
> Normalize x_table function declarations so that git context diff
> function labels work as expected.

Acked-by: Florian Westphal <fw@strlen.de>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

