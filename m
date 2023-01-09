Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC07661F46
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 08:34:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673249648;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lSCNfxemoMUMATQLAuaVb8IYJJgDhivSTDkbuYuRtyw=;
	b=Wi+ORlf1vJ+NHdpHh1VYpUWpD927kP0qOqL6wgmXAZWOGXHqcs/B3yEkE8WC4sXs3xUt4b
	w0GN6dPQGSJBd9qYyrIpebL4cJmh+eKEuS/HNCFkCGRhJzd4ogOo7bnteMNLWO7XBUXkaw
	dj0h6uDzkrEE3EbL9PjnPfDXuVEN24g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-We6tsN4kMQieFDfjiSgV4w-1; Mon, 09 Jan 2023 02:34:04 -0500
X-MC-Unique: We6tsN4kMQieFDfjiSgV4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1693C0F421;
	Mon,  9 Jan 2023 07:34:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53E93492B01;
	Mon,  9 Jan 2023 07:33:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 79C7E1947B87;
	Mon,  9 Jan 2023 07:33:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D02151946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 07:33:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B02BA492B01; Mon,  9 Jan 2023 07:33:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8FE5492B00
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 07:33:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44BDF299E758
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 07:33:48 +0000 (UTC)
Received: from icp-osb-irony-out9.external.iinet.net.au
 (icp-osb-irony-out9.external.iinet.net.au [203.59.1.226]) by
 relay.mimecast.com with ESMTP id us-mta-227-h1gAtyqzOW6WcnANfE63rw-1; Mon,
 09 Jan 2023 02:33:44 -0500
X-MC-Unique: h1gAtyqzOW6WcnANfE63rw-1
IronPort-SDR: fZInrpjI7JCfW2vZ303kaDMM7v2mLJan0jFoqI/zLJUYp6p7VPJevGC5M1cGZEpEM7BCATNGsS
 rZNt5GersoalX/Z9IQacJ5v4tRIjcPHF8EC9Qi0h+3oewByv2EyJTGoDxOSuYOPTAlBUJrN/Vw
 Vb1wAZl0dPIFXCJEfnGZsxYL3VyNKLv47fhC+1vu1UY4iLWbsjguAuJDiE6LGbKRGx6gdAE3d1
 c1SbHVb89R5CNdoI1IbVetse6dlQLwYtj80NJosSiD0lb67cO3YkAlrS9b4EKCJqTEKQia8XYq
 AFc=
X-SMTP-MATCH: 1
IronPort-Data: A9a23:Yh6FbKip9Fqb6bji5BboXJjrX161+BIKZh0ujC45NGQN5FlHY01je
 htvWW2EM6yON2r2KIgjbI63/EgC75DSnIMwT1Forng9EXsW8JqUDtmndUqhZCn6wu8v7K5EA
 2TyTvGacajYm1eF/k/F3oAMLBCQ7InQLlbGILes1htZGEk1Fk/NtTo5w7Ri2tcw0YDja++wk
 YiaT/P3aQfNNwFcbzp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMebS4K8bhL
 wr1IBBVyUuCl/slIovNfr/TLhZQGuaKVeSEoiI+t6OK2nCuqgRuifxjbKJ0hUp/0120c95NJ
 Nplt5eyWSwoHabwqeUNWB4GLCt3AJJCweqSSZS/mZT7I0zuaGTwzbN1E104e4EJ/OpxGidJ7
 /NwxDIlNEnSwbPuhuvrF68135tLwMrDZevzvllq0CvfS/8iXZHFTI3L5NlVwHE2i9wIFOu2i
 88xMms+Nk2cOkYRUrsRILVkutmQv33FT217tHywqvM17U2N4yUkhdABN/KQILRmX/59mkeeu
 3KD9nn1Aw0yLtGTyTOZtHmrg4fycTjTAttDUezgs6c63RjKnzNVCQVQXFeypL+yjUv4Us83x
 1EoxxfCZJMarCSDJuQRlTXhyJJYlnbwg+ZtLtA=
IronPort-HdrOrdr: A9a23:IKzU9aASOJCJ/hblHem355DYdb4zR+YMi2TDsHoBKiC9E/b5qy
 nApp4mPHPP5Qr5O0tApTnjAsa9qBrnnPYf3WB7B9mftWfd1FdAV7sSj7ff/w==
X-IronPort-AV: E=Sophos;i="5.96,311,1665417600"; 
 d="scan'208,217";a="399214136"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out9.iinet.net.au with ESMTP; 09 Jan 2023 15:33:43 +0800
Message-ID: <67cb9316477478e1bf04dd65ab90e9171795433d.camel@iinet.net.au>
Subject: A question on monitoring time or time management changes in the
 kernel and the adjtimex system call
From: Burn Alting <burn.alting@iinet.net.au>
To: linux-audit@redhat.com
Date: Mon, 09 Jan 2023 18:33:39 +1100
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Reply-To: burn@swtf.dyndns.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2363596064963265948=="

--===============2363596064963265948==
Content-Type: multipart/alternative; boundary="=-HRUY+6vGd80I3+BxV/jw"

--=-HRUY+6vGd80I3+BxV/jw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

All,

Would it be correct to say that when one sees an adjtimex system call audit event, a
change has occurred ONLY if either a AUDIT_TIME_ADJNTPVAL (algorithm change) or
AUDIT_TIME_INJOFFSET (time change) record is present in the event?

Thanks in advance
Burn Alting

--=-HRUY+6vGd80I3+BxV/jw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>All,</div><div><br></div><div>Would it be correct to say that when=
 one sees an adjtimex system call audit event, a change has occurred ONLY i=
f either a AUDIT_TIME_ADJNTPVAL (algorithm change) or AUDIT_TIME_INJOFFSET =
(time change) record is present in the event?</div><div><br></div><div>Than=
ks in advance</div><div>Burn Alting</div></body></html>

--=-HRUY+6vGd80I3+BxV/jw--

--===============2363596064963265948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2363596064963265948==--

