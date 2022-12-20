Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01409652923
	for <lists+linux-audit@lfdr.de>; Tue, 20 Dec 2022 23:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671576025;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hpeVjlA16okQTfjBED2oyfqSdwsn2GZwXjuJ8f4c8z0=;
	b=RQxXYqqdpAUe+ysBnLgINuE5O8APclZuVdjQQ9WUE8pSI4Df4LohfNN18+to4ALRP4sbtp
	4AYHPzzyP97sdI/H/IcAmd27bOOdLPEHWhYAUEx83/TTVUnT+nOvCh+oQhBYqnL0oMw45W
	0q7R3duc5lIs9LStWK5lBqj140C7x4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-09W2IqUcP4i36Gato49jEA-1; Tue, 20 Dec 2022 17:40:21 -0500
X-MC-Unique: 09W2IqUcP4i36Gato49jEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22FCC18E0043;
	Tue, 20 Dec 2022 22:40:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1C5D492C18;
	Tue, 20 Dec 2022 22:39:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1530119465B3;
	Tue, 20 Dec 2022 22:39:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B551E19465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 20 Dec 2022 22:39:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5ED78C16028; Tue, 20 Dec 2022 22:39:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57540C16027
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 22:39:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F631C05AA9
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 22:39:44 +0000 (UTC)
Received: from icp-osb-irony-out2.external.iinet.net.au
 (icp-osb-irony-out2.external.iinet.net.au [203.59.1.155]) by
 relay.mimecast.com with ESMTP id us-mta-158-Z2dVxclbP4KsouAcYCZPeA-1; Tue,
 20 Dec 2022 17:39:41 -0500
X-MC-Unique: Z2dVxclbP4KsouAcYCZPeA-1
IronPort-SDR: Kcye09VGQqV4Fqs3QijW7x8Jv7L0MSVOj4gx//V/TVrKd8635cWpSbaSYfPSDScE+Rz7GY/kx/
 NZdIBvqrzdW4l9kmyaUpx76VHeo9F1ZVYhMWlCwpEC8Ptqf0AbGvxyDMDLxNwJpIE7F05/W1zE
 Ys364TFVqyNu+Bj6whRZhAptXI6FQCVC7NQ21ez+GlwoFkuPB2IgdSE/JRPCGTuO+V8d7UE8yW
 MX4na3gCYnT8yu7v3Mwre2+m5UbhDogTnDwbVm1r3yhiI4SgZtJyFns3wkpPbJvPcRvH3l2huI
 vJQ=
X-SMTP-MATCH: 1
IronPort-Data: A9a23:wAZa9q2w8YWFtMVwuvbD5SRzkn2cJEfYwER7XKvMYLTBsI5bpwWzt
 Nbn7RIyw0v2EmDwS237GIy29Xqy2SMM/2ICOAJcGUtFFhqmkuKYQ4XHRqvMF3nKdJeaFhg/t
 552huTod6jYcFeN/n9BDZC89RGQ5YnQLlYrILeZUszZbVYMpBYJ0XqPqcZg6mJbqYHR7ze2h
 D/Hi5a31GlJetJDGjl8B6qr8HuDtdyu42lA5gRWifpj5DcynFFNZH4TDf3qdSOgGuG4E8biL
 9svwo1V8Uv44zYGOsyAk4zhMWopWeD8ZhnUrlV/Dv3Kbhhq/kTe044gK+YSL1xIlzvPk8F3x
 NNW85uqRm/FPIWWwbVbAkEeSnEje/Qfp9crIlDm2SCX50fbaX2qyvFyDUc5FYwZ/OtrR2dD6
 boRNVjhazjf3Lnvne3mFbgEasILKvvhPp5AmlNcxCDeK8QdAsGEYpTb6ooNtNs3roUUdRrEX
 OIdaDxyfFHJfhFOJn8NBZ4+lfvujX76GwC0s3rP/PtysjCWlVwsleG0b5zUYpqDScxQ2E2fo
 yTP4gwVHy0nCTBW8hLdmlrEuwMFtXmhMG7OPNVULsJXvWA=
IronPort-HdrOrdr: A9a23:9KSbjaDEsPPEAt/lHemL55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8sjyqXTP+U4ssR0b6LK90dC7MBXhHOBOkPQs1MaZPTUO41HYVb2KhLGKq1Hd8gLFmdK1vp
 0QEJSWZueAaGSThq7BkW6F+55J+rO6GOrBv4rjJzkHd3APV0mBhz0JcDpz5XcGPzV7OQ==
X-IronPort-AV: E=Sophos;i="5.96,259,1665417600"; 
 d="scan'208,217";a="433157579"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out2.iinet.net.au with ESMTP; 21 Dec 2022 06:36:30 +0800
Message-ID: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
Subject: BPF audit logs
From: Burn Alting <burn.alting@iinet.net.au>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Date: Wed, 21 Dec 2022 09:36:28 +1100
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8935228794384822059=="

--===============8935228794384822059==
Content-Type: multipart/alternative; boundary="=-UeaGriMLonW6oOkhKTf8"

--=-UeaGriMLonW6oOkhKTf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
I note that the unsolicited AUDIT_BPF audit event only provides a program id and
operation (load or unload). For example, 	type=BPF msg=audit(21/12/22
09:03:35.765:439) : prog-id=75 op=LOAD or	type=BPF msg=audit(21/12/22
09:04:05.883:460) : prog-id=0 op=UNLOAD
I also note that the bpf auxillary structure (struct bpf_prog_aux) that holds the
program id value, also holds a name (struct bpf_prog_aux->name) and uid  (struct
bpf_prog_aud->user_struct->uid). Perhaps adding these two items to the AUDIT_BPF
event would provide more security context for this unsolicited event.
Thoughts?
RgdsBurn Alting

--=-UeaGriMLonW6oOkhKTf8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Hi,</div><div>
I note that the unsolicited AUDIT_BPF audit event only provides a program i=
d and operation (load or unload). For example, </div><div>=09type=3DBPF msg=
=3Daudit(21/12/22 09:03:35.765:439) : prog-id=3D75 op=3DLOAD&nbsp;</div><di=
v></div><div>or</div><div>=09type=3DBPF msg=3Daudit(21/12/22 09:04:05.883:4=
60) : prog-id=3D0 op=3DUNLOAD</div><div><br></div><div>I also note that the=
 bpf auxillary structure (struct bpf_prog_aux) that holds the program id va=
lue, also holds a name&nbsp;(struct bpf_prog_aux-&gt;name) and uid  (struct=
 bpf_prog_aud-&gt;user_struct-&gt;uid).&nbsp;</div><div>Perhaps adding thes=
e two items to the AUDIT_BPF event would provide more security context for =
this unsolicited event.</div><div><br></div><div>Thoughts?</div><div><br></=
div><div>Rgds</div><div>Burn Alting</div><div></div></body></html>

--=-UeaGriMLonW6oOkhKTf8--

--===============8935228794384822059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8935228794384822059==--

